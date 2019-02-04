R
######

**PLEASE READ THE 'CONCEPTS' DOCUMENTATION TAB FIRST IF IT'S YOUR FIRST TIME USING THE CLIENT**

Install
*******

The **r client for bender** is available with the ``devtools::install_github("Dreem-Organization/bender-r-client")`` command.

Initialization and Login
****************

**Make sure you already created a Bender account on** `the web client <https://bender.dreem.com/>`_ !

.. code-block:: r

    b = bender::Bender$new("my_email", "my_password", host='https://bender-api.dreem.com')

When you create a new bender object, it will automatically try to connect to the bender API so make sure you have a working internet connection.

The email and password are the one you use to log into bender.dreem.com

When running the Bender ecosystem, you want to use your own API, so when initializing the bender object you can set a host parameter which is by default set to the adress of our servers.

******************

Experiment methods
******************

List experiments
----------------

Return a list of the connected user's experiments.

.. code-block:: r

    b$list_experiments()

**Prototype :**

``list_experiments()``

**Arguments :**

*none*

**Return :**

*list*

``list(list(name="exp_1", id="0597ca48-6..."), list(name="exp_2", id="68hj547r5-6..."))``

Set experiment
--------------

Setup current experiment for the connected user.

.. code-block:: r

    b$set_experiment(name, id)

**Prototype :**

``set_experiment(name=NULL, id=NULL)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **name**          | *string* | Give the name of the experiment you want to retrieve and set as current |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"my_experiment"``                                                     |
+-------------------+----------+-------------------------------------------------------------------------+
| **id**            | *string* | Give the id of the experiment you want to retrieve and set as current   |
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

    b$create_experiment(name, metrics, description, dataset, dataset_parameters)

**Prototype :**

``create_experiment(name, metrics, description=NULL, dataset=NULL, dataset_parameters=NULL)``

**Arguments :**

+-----------------+----------+---------------------------------------------------------------------------------------------------+
| Argument        | Type     | Description and Example                                                                           |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **name**        | *string* | Name of your experiment                                                                           |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``"my_experiment"``                                                                               |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **metrics**     | *list*   | List of the performance metrics used to evaluate your experiment                                  |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``list(list(metric_name="metric_a", type="reward" ), list(metric_name="metric_b", type="loss"))`` |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **description** | *string* | Short description of the experiment's purpose                                                     |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``"This experiment is just a random algorithm."``                                                 |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **dataset**     | *string* | Name the dataset you are using for your experiment                                                |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``"dataset_name.csv"``                                                                            |
+-----------------+----------+---------------------------------------------------------------------------------------------------+
| **dataset**     | *list*   | An object describing your dataset                                                                 |
+                 +          +---------------------------------------------------------------------------------------------------+
|                 |          | ``list(version=0.1, CV_folds="10")``                                                              |
+-----------------+----------+---------------------------------------------------------------------------------------------------+

**Return :**

*none*

Delete experiment
-----------------

Delete targeted experiment of the connected user.

.. code-block:: r

    b$delete_experiment(id)

**Prototype :**

``delete_experiment(id=NULL)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **id**            | *string* | Give the id of the experiment you want to retrieve and delete           |
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

    b$list_algos()

**Prototype :**

``list_algos()``

**Arguments :**

*none*

**Return :**

*list*

``list(list(name="algo_1", id="0597ca48-6..."), list(name="algo_2", id="68hj547r5-6..."))``

Set algo
--------

Setup current algo for the connected user.

.. code-block:: python

    b$set_algo(name, id)

**Prototype :**

``set_algo(name=NULL, id=NULL)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **name**          | *string* | Give the name of the algo you want to retrieve and set as current       |
+                   +          +-------------------------------------------------------------------------+
|                   |          | ``"my_algo"``                                                           |
+-------------------+----------+-------------------------------------------------------------------------+
| **id**            | *string* | Give the id of the algo you want to retrieve and set as current         |
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

    b$create_algo(name, hyperparameters, description)

**Prototype :**

``create_algo(name, hyperparameters, description=NULL)``

**Arguments :**

+----------------------+----------+---------------------------------------------------------------------------------------------------+
| Argument             | Type     | Description and Example                                                                           |
+----------------------+----------+---------------------------------------------------------------------------------------------------+
| **name**             | *string* | Name of your algo                                                                                 |
+                      +          +---------------------------------------------------------------------------------------------------+
|                      |          | ``"my_algo"``                                                                                     |
+----------------------+----------+---------------------------------------------------------------------------------------------------+
| **hyperparameters**  | *list*   | List of the hyperparameters used by the algo                                                      |
+                      +          +---------------------------------------------------------------------------------------------------+
|                      |          | ``list(list(name="param_name",category="categorical",search_space=list(values=list(3, 5, 7))))``  |
+----------------------+----------+---------------------------------------------------------------------------------------------------+
| **description**      | *string* | Short description of the algo's principle                                                         |
+                      +          +---------------------------------------------------------------------------------------------------+
|                      |          | ``"This algo is a useless one."``                                                                 |
+----------------------+----------+---------------------------------------------------------------------------------------------------+

**Return :**

*none*

Delete algo
-----------

Delete targeted algo of the connected user.

.. code-block:: python

    b.delete_algo(algo_id)

**Prototype :**

``delete_algo(algo_id=NULL)``

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

    b$list_trials()

**Prototype :**

``list_trials()``

**Arguments :**

*none*

**Return :**

*list*

A list of trials.

Create trial
------------

Create new trial for the current algo.

.. code-block:: python

    b$create_trial(name, hyperparameters, description)

**Prototype :**

``create_trial(results, hyperparameters, weight=1, comment=NULL)``

**Arguments :**

+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| Argument             | Type      | Description and Example                                                                           |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| **results**          | *list*    | Array of obtained metrics                                                                         |
+                      +           +---------------------------------------------------------------------------------------------------+
|                      |           | ``list(metric1=0.8, metric2=0.3)``                                                                |
+----------------------+-----------+---------------------------------------------------------------------------------------------------+
| **hyperparameters**  | *list*    | List of the hyperparameters used by the algo                                                      |
+                      +           +---------------------------------------------------------------------------------------------------+
|                      |           | ``list(param1="value", param2=3567, param3="another"}``                                           |
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

    b$delete_trial(trial_id)

**Prototype :**

``delete_trial(id=NULL)``

**Arguments :**

+-------------------+----------+-------------------------------------------------------------------------+
| Argument          | Type     | Description and Example                                                 |
+-------------------+----------+-------------------------------------------------------------------------+
| **id**            | *string* | Give the id of the trial you want to retrieve and delete                |
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

    b$suggest(metric, optimizer)

**Prototype :**

``suggest(metric=NULL, optimizer="parzen_estimator")``

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
|                   |          | ``"parzen_estimator" || "random"``                                                  |
+-------------------+----------+-------------------------------------------------------------------------+

**Return :**

*list*

``list(param1="value", param2=3567, param3="another")``
