*******************************
Welcome to Bender Documentation
*******************************

Bender Clients Status
*********************
.. image:: https://img.shields.io/badge/web-up-green.svg?colorA=555555&colorB=97C901&logo=react&logoColor=DDDDDD&style=for-the-badge
   :target: https://bender.dreem.com/
   :alt: Bender Web Client
.. image:: https://img.shields.io/pypi/v/bender-client.svg?label=python&colorA=555555&colorB=97C901&logo=python&logoColor=DDDDDD&style=for-the-badge
   :target: https://pypi.python.org/pypi/bender-client
   :alt: Bender Python Client
.. image:: https://img.shields.io/badge/r-wip-red.svg?colorA=555555&logo=r&logoColor=DDDDDD&style=for-the-badge
   :target: https://bender.dreem.com/
   :alt: Bender R Client
.. image:: https://img.shields.io/badge/matlab-wip-red.svg?colorA=555555&logo=codeforces&logoColor=DDDDDD&style=for-the-badge
   :target: https://bender.dreem.com/
   :alt: Bender Mathlab Client

About Bender
************

Bender is a hyperparameters optimizer for black box optimization. It is currently open-access but we plan to open-source all its components.

It features 3 kind of components:

- *benderopt*: A custom library implementing 3 algorithms:
    - Random Search
    - Parzen Estimator Optimization (TPE-like)
    - Model Based Optimization (SMAC-like)

- *bender-api*: A high level interface to interact with bender functionalities.
    - CRUD for experiments, algorithms and trials.
    - Relies on benderopt for suggesting new hyperparameters to try.

- *Various clients* to give you access to Bender functionalities from anywhere:
    - *web-client* available at ``https://bender.dreem.com``
    - *python-client* available by ``pip install bender-client``