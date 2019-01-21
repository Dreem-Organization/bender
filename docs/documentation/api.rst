API
######

**PLEASE READ THE 'CONCEPTS' DOCUMENTATION TAB FIRST IF IT'S YOUR FIRST TIME USING THE API**

Base route
**********

All routes starts with the following base : ``http://bender-api.dreem.com``

The Api is using JWT authentication so don't forget to sent the token in your request headers (You can get it with the login route).

**Make sure you already created a Bender account on** `the web client <https://bender.dreem.com/>`_ !

Login
*****

**POST** ``/api/login``

**Body**

.. code-block:: json

    {
        "email": "my@mail.com", # STRING
        "password": "mydeepestsecret", #STRING
    }

**Return**

.. code-block:: json

    {
        "token": "FNU87TR875R7IFO873F8E873T", # STRING
        "user": {
            "pk": 83, # NUMBER
            "username": "my_user",  # STRING
            "email": "my@mail.com",  # STRING
            "first_name": "my_first_name",  # STRING
            "last_name": "my_last_name",  # STRING
        }
    }

******************

Experiment methods
******************

List experiments
----------------

**GET** ``/api/experiments/?owner=<username_of_your_account>``

.. code-block:: python

    b.list_experiments()

**Prototype :**

``list_experiments()``

**Arguments :**

*none*

**Return :**

*array*

``[{ "name": "exp_1", "id": "0597ca48-6..." }, { "name": "exp_2", "id": "68hj547r5-8..." } ]``

Set experiment
--------------

Setup current experiment for the connected user.

.. code-block:: python

    b.set_experiment(name, experiment_id)

**Prototype :**

``set_experiment(name=None, experiment_id=None)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **name**          | *string* | Give the name of the experiment you want to retrieve and set as current |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"my_experiment"``                                                     |
+-------------------+----------+-------------------------------------------------------------------------+
| **experiment_id** | *string* | Give the id of the experiment you want to retrieve and set as current   |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"0597ca48-66f7-42be-9021-12ec57d4251e"``                              |
+-------------------+----------+-------------------------------------------------------------------------+

**Return :**

*none*

Create experiment
-----------------

Create new experiment and setup current experiment for the connected user.

*If experiment name already exists, the already existing one is set by default as current experiment.*

.. code-block:: python

    b.create_experiment(name, metrics, description, dataset, dataset_parameters)

**Prototype :**

``create_experiment(name, metrics, description=None, dataset=None, dataset_parameters=None)``

**Arguments :**

+-----------------+----------+---------------------------------------------------------------------------------------------------+
| Argument        | Type     | Description and Example                                                                           |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **name**        | *string* | Name of your experiment                                                                           |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``"my_experiment"``                                                                               |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **metrics**     | *array*  | List of the performance metrics used to evaluate your experiment                                  |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``[ {"metric_name": "metric_a","type": "reward" }, {"metric_name": "metric_b","type": "loss" }]`` |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **description** | *string* | Short description of the experiment's purpose                                                     |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``"This experiment is just a random algorithm."``                                                 |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **dataset**     | *string* | Name the dataset you are using for your experiment                                                |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``"dataset_name.csv"``                                                                            |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **dataset**     | *dict*   | An object describing your dataset                                                                 |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``{ "version": 0.1, "CV_folds": "10" }``                                                          |
+-----------------+----------+---------------------------------------------------------------------------------------------------+

**Return :**

*none*

Get experiment
--------------

Return the current experiment.

.. code-block:: python

    b.get_experiment()

**Prototype :**

``get_experiment()``

**Arguments :**

*none*

**Return :**

*dict*

A full experiment object.

Delete experiment
-----------------

Delete targeted experiment of the connected user.

.. code-block:: python

    b.delete_experiment(experiment_id)

**Prototype :**

``delete_experiment(experiment_id=None)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **experiment_id** | *string* | Give the id of the experiment you want to retrieve and delete           |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"0597ca48-66f7-42be-9021-12ec57d4251e"``                              |
+-------------------+----------+-------------------------------------------------------------------------+

**Return :**

*none*


************

Algo methods
************

List algos
----------

Return a list of the connected user's algos.

.. code-block:: python

    b.list_algos()

**Prototype :**

``list_algos()``

**Arguments :**

*none*

**Return :**

*array*

``[{ "name": "algo_1", "id": "0597ca48-6..." }, { "name": "algo_2", "id": "68hj547r5-8..." } ]``

Set algo
--------

Setup current algo for the connected user.

.. code-block:: python

    b.set_algo(name, algo_id)

**Prototype :**

``set_algo(name=None, algo_id=None)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **name**          | *string* | Give the name of the algo you want to retrieve and set as current       |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"my_algo"``                                                           |
+-------------------+----------+-------------------------------------------------------------------------+
| **algo_id**       | *string* | Give the id of the algo you want to retrieve and set as current         |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"0597ca48-66f7-42be-9021-12ec57d4251e"``                              |
+-------------------+----------+-------------------------------------------------------------------------+

**Return :**

*none*

Create algo
-----------

Create new algo and setup current algo for the connected user.

*If algo name already exists, the already existing one is set by default as current algo.*

.. code-block:: python

    b.create_algo(name, parameters, description)

**Prototype :**

``create_algo(name, hyperparameters, description=None)``

**Arguments :**

+----------------------+----------+---------------------------------------------------------------------------------------------------+
| Argument             | Type     | Description and Example                                                                           |
+----------------------+----------+---------------------------------------------------------------------------------------------------+
| **name**             | *string* | Name of your algo                                                                                 |
+                      +          +---------------------------------------------------------------------------------------------------+
|                      |          | ``"my_algo"``                                                                                     |
+----------------------+----------+---------------------------------------------------------------------------------------------------+
| **hyperparameters**  | *array*  | List of the hyperparameters used by the algo                                                      |
+                      +          +---------------------------------------------------------------------------------------------------+
|                      |          | ``[{"name": "param_name","category": "categorical", "search_space": { "values": [3, 5, 7] } }]``  |
+----------------------+----------+---------------------------------------------------------------------------------------------------+
| **description**      | *string* | Short description of the algo's principle                                                         |
+                      +          +---------------------------------------------------------------------------------------------------+
|                      |          | ``"This algo is a useless one."``                                                                 |
+----------------------+----------+---------------------------------------------------------------------------------------------------+

**Return :**

*none*

Get algo
--------

Return the current algo.

.. code-block:: python

    b.get_algo()

**Prototype :**

``get_algo()``

**Arguments :**

*none*

**Return :**

*dict*

A full algo object.

Delete algo
-----------

Delete targeted algo of the connected user.

.. code-block:: python

    b.delete_algo(algo_id)

**Prototype :**

``delete_algo(algo_id=None)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **algo_id**       | *string* | Give the id of the algo you want to retrieve and delete                 |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"0597ca48-66f7-42be-9021-12ec57d4251e"``                              |
+-------------------+----------+-------------------------------------------------------------------------+

**Return :**

*none*

**************

Trials methods
**************

List trials
-----------

List all trials of the current algo.

.. code-block:: python

    b.list_trials()

**Prototype :**

``list_trials()``

**Arguments :**

*none*

**Return :**

*array*

An array of trials dict.

Create trial
------------

Create new trial for the current algo.

.. code-block:: python

    b.create_trial(name, hyperparameters, description)

**Prototype :**

``create_trial(results, hyperparameters, weight=1, comment=None)``

**Arguments :**

+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| Argument             | Type      | Description and Example                                                                           |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| **results**          | *dict*    | Array of obtained metrics                                                                         |
+                      +           +---------------------------------------------------------------------------------------------------+
|                      |           | ``{"metric1": 0.8, "metric2": 0.3}``                                                              |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| **hyperparameters**  | *dict*    | List of the hyperparameters used by the algo                                                      |
+                      +           +---------------------------------------------------------------------------------------------------+
|                      |           | ``{"param1": "value","param2": 3567, "param3": "another"}``                                       |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| **weight**           | *integer* | The importance of your result                                                                     |
+                      +           +---------------------------------------------------------------------------------------------------+
|                      |           | ``0.5``                                                                                           |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| **comment**          | *string*  | Anything you want to say about this trial                                                         |
+                      +           +---------------------------------------------------------------------------------------------------+
|                      |           | ``"This is a normal trial."``                                                                     |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+

**Return :**

*none*

Delete trial
------------

Delete targeted trial from current algo.

.. code-block:: python

    b.delete_trial(trial_id)

**Prototype :**

``delete_trial(trial_id=None)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **trial_id**      | *string* | Give the id of the trial you want to retrieve and delete                |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"0597ca48-66f7-42be-9021-12ec57d4251e"``                              |
+-------------------+----------+-------------------------------------------------------------------------+

**Return :**

*none*

***************

General methods
***************

Suggest
-------

Ask bender a suggestion on a hyperparameters set to use

.. code-block:: python

    b.suggest(metric, optimizer)

**Prototype :**

``suggest(metric=None, optimizer="parzen_estimator")``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **metric**        | *string* | A metric on which to base the suggestion                                |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"accuracy"``                                                          |
+-------------------+----------+-------------------------------------------------------------------------+
| **optimizer**     | *string* |                                                                         |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"parzen_estimator"``                                                  |
+-------------------+----------+-------------------------------------------------------------------------+

**Return :**

*dict*

``{"param1": "value","param2": 3567, "param3": "another"}``

Revoke credentials
------------------

Remove the registered credentials from this computer

.. code-block:: python

    b.revoke_credentials()

Hello
-----

.. code-block:: python

    b._say_hello()