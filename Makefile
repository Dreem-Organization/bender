define conf
$(shell node -p "require('./.benderconf.json').$(1)")
endef

# Color variables
_BOLD=\x1b[1m
_END=\x1b[0m
_RED=\x1b[31m
_GREEN=\x1b[32m
_CYAN=\x1b[36m
_WARN=\x1b[33;01m
_ERROR=\x1b[31;01m
_OK=\x1b[32;01m

# Env variables
WEB_CLIENT_PORT		:= $(call conf, benderWebClient.localhostPort)
API_PORT			:= $(call conf, benderApi.localhostPort)
USERNAME			:= $(call conf, benderDatabase.username)
EMAIL				:= $(call conf, benderDatabase.email)
PASSWORD			:= $(call conf, benderDatabase.password)
DATABASE_PATH		:= $(call conf, benderDatabase.databasePath)

all: install build start

install:
	@echo "${_CYAN}======== STARTING INSTALL PROCESS ========${_END}"
	@echo "${_OK} => Creating ./local folder...${_END}"
	-@mkdir -p ./local;
	-@mkdir -p ./local/bender-database;
	@echo "${_OK} => Downloading Bender dependencies...${_END}"
ifeq ($(wildcard ./local/bender-web-client/.*),)
	-@git clone -q -b dev https://github.com/Dreem-Organization/bender-web-client.git ./local/bender-web-client;
endif
ifeq ($(wildcard ./local/bender-api/.*),)
	-@git clone -q -b open-sourcing https://github.com/Dreem-Organization/bender-back.git ./local/bender-api;
endif
	@echo "${_CYAN}======== FINISHED INSTALL PROCESS ========${_END}"

build:
	@echo "${_CYAN}======== STARTING BUILDING PROCESS =======${_END}"
ifeq ($(API_PORT), undefined)
	$(eval API_PORT := 3000)
	@echo "${_ERROR} XX No api port defined in .benderconf, using default.${_END}"
endif
	@echo "${_OK} => Building Bender services...${_END}"
	@USERNAME='' EMAIL='' PASSWORD='' DATABASE_PATH='' API_PORT=$(API_PORT) docker-compose build
	@echo "${_CYAN}======== FINISHED INSTALL PROCESS =======${_END}"

start:
	@echo "${_CYAN}========== LAUNCHING SERVICES ===========${_END}"
ifeq ($(WEB_CLIENT_PORT), undefined)
	$(eval WEB_CLIENT_PORT := 3000)
	@echo "${_ERROR} XX No web client port defined in .benderconf, using default.${_END}"
endif
ifeq ($(API_PORT), undefined)
	$(eval API_PORT := 3000)
	@echo "${_ERROR} XX No api port defined in .benderconf, using default.${_END}"
endif
ifeq ($(DATABASE_PORT), undefined)
	$(eval DATABASE_PORT := 5432)
	@echo "${_ERROR} XX No database port defined in .benderconf, using default.${_END}"
endif
ifeq ($(USERNAME), undefined)
	$(eval USERNAME := 'superuser')
	@echo "${_ERROR} XX No username defined in .benderconf, using default.${_END}"
endif
ifeq ($(EMAIL), undefined)
	$(eval EMAIL := 'superuser@bender.com')
	@echo "${_ERROR} XX No email defined in .benderconf, using default.${_END}"
endif
ifeq ($(PASSWORD), undefined)
	$(eval PASSWORD := 'superuser')
	@echo "${_ERROR} XX No password defined in .benderconf, using default.${_END}"
endif
ifeq ($(DATABASE_PATH), undefined)
	$(eval DATABASE_PATH := './local/bender-database')
	@echo "${_ERROR} XX No databasePath defined in .benderconf, using default.${_END}"
endif
	@echo "${_OK} => Web client starting at http://localhost:$(WEB_CLIENT_PORT)...${_END}"
	@echo "${_OK} => API starting at http://localhost:$(API_PORT)...${_END}"
	@echo "${_OK} => Creating database in $(DATABASE_PATH)...${_END}"
	@echo "${_OK} => Creating user [username=${USERNAME}, email=${EMAIL} password=${PASSWORD}]...${_END}"
	@echo "${_OK} => Database starting at http://localhost:$(DATABASE_PORT)...${_END}"
	@WEB_CLIENT_PORT=$(WEB_CLIENT_PORT) API_PORT=$(API_PORT) DATABASE_PORT=$(DATABASE_PORT) DATABASE_PATH=$(DATABASE_PATH) USERNAME=$(USERNAME) EMAIL=$(EMAIL) PASSWORD=$(PASSWORD) docker-compose up
	@echo "${_CYAN}================== END ==================${_END}"

stop:
	@echo "${_CYAN}=========== STOPPING SERVICES ===========${_END}"
	@USERNAME='' EMAIL='' PASSWORD='' DATABASE_PATH='' docker-compose stop -t 2
	@echo "${_CYAN}================== END ==================${_END}"

clear:
	@echo "${_CYAN}======== STARTING CLEANING PROCESS =======${_END}"
	-@USERNAME='' EMAIL='' PASSWORD='' DATABASE_PATH='' docker-compose rm -f -s -v;
	@rm -rf ./local;
	@echo "${_CYAN}======== FINISHED CLEANING PROCESS =======${_END}"
