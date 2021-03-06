*******************************
Welcome to Bender Documentation
*******************************

Bender Clients Status
*********************
.. image:: https://img.shields.io/badge/web-up-green.svg?colorA=555555&colorB=97C901&logo=react&logoColor=DDDDDD&style=for-the-badge
   :target: https://bender.dreem.com/
   :alt: Bender Web Client
.. image:: https://img.shields.io/badge/api-up-green.svg?colorA=555555&colorB=97C901&logo=salesforce&logoColor=DDDDDD&style=for-the-badge
   :target: https://bender-optimizer.readthedocs.io/en/latest/documentation/api.html
   :alt: Bender Web Client
.. image:: https://img.shields.io/pypi/v/bender-client.svg?label=python&colorA=555555&colorB=97C901&logo=python&logoColor=DDDDDD&style=for-the-badge
   :target: https://pypi.python.org/pypi/bender-client
   :alt: Bender Python Client
.. image:: https://img.shields.io/badge/r-V0.1.1-green.svg?colorA=555555&logo=r&logoColor=DDDDDD&style=for-the-badge
   :target: https://cran.r-project.org/web/packages/bender/index.html
   :alt: Bender R Client
.. image:: https://img.shields.io/badge/benderopt-open%20source-green.svg?colorA=555555&colorB=97C901&logo=github&logoColor=DDDDDD&style=for-the-badge
   :target: https://github.com/Dreem-Organization/benderopt
   :alt: Benderopt Lib

About Bender
************

Bender is a hyperparameters optimizer for black box optimization. It is currently open-access but we plan to open-source all its components.

It features 3 kind of components:

- *benderopt*: A custom library implementing 2 algorithms:
    - Random Search
    - Parzen Estimator Optimization (TPE-like)

- *bender-api*: A high level interface to interact with bender functionalities.
    - CRUD for experiments, algorithms and trials.
    - Relies on benderopt for suggesting new hyperparameters to try.

- *Various clients* to give you access to Bender functionalities from anywhere:
    - *web-client* available at ``https://bender.dreem.com``
    - *python-client* available by ``pip install bender-client``

.. image:: https://static.rythm.co/bender/workflow_diagram_api_web_client.jpg
   :alt: API - WEB CLIENT

.. image:: https://static.rythm.co/bender/workflow_diagram_api_other_client@large.jpg
   :alt: API - OTHER CLIENTS

You can find a medium post about bender here:
https://medium.com/@dylanheirstraeten/bender-c394a5bda78b


Use bender locally
******************

If you don't want to use our online services, you still have the option to run bender locally using docker.

**Prerequisites**: docker and git

To do so, first clone, fork, or download this repository, and from its root run the following command lines :

(**WARNING**: *This will be done with default settings, to change the installation and initialisation settings please scroll to the next header*) 

``make install`` : To download all the ressources needed and install all bender dependencies into ./local

``make build`` : To build the different dependencies.

``make start`` : To run the database, the API and the frontend.

``make`` : Tu do the 3 above commands at the same time.

``make stop`` : To stop all bender services.

``make clear`` : To remove all bender services, source files, images and containers.


*To use the different clients with the local API check the its specific documentation*.

Configure bender locally
************************

Bender will use the configuration file in ``.benderconf``.

It is defined in JSON syntax and looks like the following :

.. code-block:: json

    {
        "benderWebClient": {
            "localhostPort": <the port you want to use on localhost to expose the web-client>
        },
        "benderApi": {
            "localhostPort": <the port you want to use on localhost to expose the api>
        },
        "benderDatabase": {
            "username": <the username of the admin acount to create in the database>,
            "email": <the email of the admin acount to create in the database>,
            "password": <the password of the admin acount to create in the database>,
            "databasePath": <the local volume to mount on the database docker to host your database>,
            "localhostPort": <the port you want to use on localhost to expose the database>
        }
    }
