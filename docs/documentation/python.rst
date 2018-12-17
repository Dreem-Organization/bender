Python
######

**PLEASE READ THE 'GENERAL' DOCUMENTATION TAB FIRST IF IT'S YOUR FIRST TIME USING THE CLIENT**

Install
*******

The **python client for bender** is available with the ``pip install bender-client`` command.

Or you can just download it from it's `github repo <https://github.com/Dreem-Organization/Bender-Client>`_ if you want.

Import and Login
****************

**Make sure you already created a Bender account on** `the web client <https://bender.dreem.com/>`_ !

.. code-block:: python

    from bender import Bender
    b = Bender()

When you create a new bender object, it will automatically try to connect to the bender API so make sure you have a working internet connection.

The log-in menu will be prompt in the python console and ask for your email and password : it will create a temporary file on your computer with your credentials so you won't have to login each time.

******************

Experiment methods
******************

List experiments
----------------

Return a list of the connected user's experiments.

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

    b.delete_experiment(name, experiment_id)

**Prototype :**

``delete_experiment(name=None, experiment_id=None)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **name**          | *string* | Give the name of the experiment you want to retrieve and delete         |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"my_experiment"``                                                     |
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

List current experiment for the connected user.

.. code-block:: python

    b.list_algos()

**Prototype :**

``list_algos()``

**Arguments :**

*none*

**Return :**

*array*

``[{ "name": "exp_1", "id": "0597ca48-6..." }, { "name": "exp_2", "id": "68hj547r5-8..." } ]``

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

``create_algo(name, hyper_parameters, description=None)``

**Arguments :**

+----------------------+----------+---------------------------------------------------------------------------------------------------+
| Argument             | Type     | Description and Example                                                                           |
+----------------------+----------+---------------------------------------------------------------------------------------------------+
| **name**             | *string* | Name of your algo                                                                                 |
+                      +          +---------------------------------------------------------------------------------------------------+
|                      |          | ``"my_algo"``                                                                                     |
+----------------------+----------+---------------------------------------------------------------------------------------------------+
| **hyper_parameters** | *array*  | List of the hyper_parameters used by the algo                                                     |
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

    b.delete_algo(name, algo_id)

**Prototype :**

``delete_algo(name=None, algo_id=None)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **name**          | *string* | Give the name of the algo you want to retrieve and delete               |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"my_algo"``                                                           |
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

    b.create_trial(name, hyper_parameters, description)

**Prototype :**

``create_trial(results, hyper_parameters, weight=1, comment=None)``

**Arguments :**

+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| Argument             | Type      | Description and Example                                                                           |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| **results**          | *dict*    | Array of obtained metrics                                                                         |
+                      +           +---------------------------------------------------------------------------------------------------+
|                      |           | ``{"metric1": 0.8, "metric2": 0.3}``                |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| **hyper_parameters** | *dict*    | List of the hyper_parameters used by the algo                                                     |
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

    b.delete_trial(name, trial_id)

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