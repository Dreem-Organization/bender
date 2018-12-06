Bender
######

Bender is a hyperparameters optimizer for black box optimization. It is currently open-access but we plan to open-source all its components.

It features 3 kind of components:

* benderopt: A custom library implementing 3 kinds of algorithms:
    - Random Search
    - Parzen Estimator Optimization (TPE-like)
    - Model Based Optimization (SMAC-like)

* bender-back: A backend able to store experiments, results and relying on benderopt for suggesting new hyperparameters to try

* Clients to interact with bender-backs:
    - web app at htttps://bender.dreem.com
    - python client