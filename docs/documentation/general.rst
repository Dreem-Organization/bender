General
#######

Experiment
----------

Here is an example of an **Experiment** object

.. code-block:: json

    {
        "algo_count": 1,
        "created": "2018-11-20T09:43:43.442381Z",
        "dataset": "Iris_dataset.csv",
        "dataset_parameters": {"param_1": "somevalue", "param_2": 12},
        "description": "It is just a demo experiment to show you what's inside.",
        "id": "6616120a-28b2-4c8b-a1c6-7f18c639632c",
        "metrics": [
            { "metric_name": "metric_1", "type": "reward" },
            { "metric_name": "metric_2", "type": "loss" }
        ],
        "name": "Demo Experiment",
        "owner": "bender_admin",
        "trial_count": 2
    }

- **algo_count** : *number* - Number of algos in this experiment
- **created** : *string* - Date of creation
- **dataset** : *string* - Name of the used dataset
- **dataset_parameters** : *dict* - Custom object to store your own metadata about your experiment
- **description** : *string* - Quick description of the experiment
- **id** : *string* - Id of the experiment
- **metrics**: *array* - Each one of them should be either from type ``loss`` or ``reward`` depending if you are trying to ``minimize`` or ``maximize`` this metric in your experiment.
- **name** : *string* - Name of the experiment
- **owner** : *string* - Owner of the experiment
- **trial_count** : *number* - Number of trials in this experiment

Algo
----

Here is an example of an **Algo** object

.. code-block:: json

    {
        "id": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "sklearn-svm",
        "owner": "bender_admin",
        "experiment": "6616120a-28b2-4c8b-a1c6-7f18c639632c",
        "created": "2018-11-07T17:01:27.286194Z",
        "description": "One of the various possibilities.",
        "parameters": [
            {
                "algo": "0597ca48-66f7-42be-9021-12ec57d4251e"
                "category": "categorical"
                "name": "kernel"
                "search_space": { "values": ["linear", "poly", "rbf", "sigmoid"] }
            },
            {
                "algo": "0597ca48-66f7-42be-9021-12ec57d4251e"
                "category": "uniform"
                "name": "C"
                "search_space": { "high": 5, "step": 0.1, "low": -5 }
            }
        ]
        "trial_count": 60
    }

- **created** : *string* - Date of creation
- **description** : *string* - Quick description of the algo
- **experiment** : *string* - Id of the experiment
- **id** : *string* - Id of the algo
- **name** : *string* - Name of the algo
- **owner** : *string* - Owner of the algo
- **parameters**: *array* - An array of hyperparameters (see the hyperparameters section just below)
- **trial_count** : *number* - Number of trials in this 

Hyperparameters
---------------

Here are some examples of **Hyperparameters** objects that can appear in an Algo.

.. code-block:: json

    {
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "x1",
        "category": "uniform",
        "search_space": {
            "low": 0,
            "high": 10,
        }
    }  #  some examples: 8.364, 2.3, 4.5, etc.

    {
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "x1_step",
        "category": "uniform",
        "search_space": {
            "low": 0,
            "high": 10,
            "step": 1
        }
    }  #  some examples: 0, 5, 6, 7, etc.

    {
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "x2",
        "category": "loguniform",
        "search_space": {
            "low": 1e4,
            "high": 1e6,
            "base": 10,
        }
    }  #  some examples: 3.14456e4, 5.36412e5, 9.12450e6, etc.

    {
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "x2_step",
        "category": "loguniform",
        "search_space": {
            "low": 1e4,
            "high": 1e6,
            "step": 1e3,
            "base": 10,
        }
    }  #  some examples: 3.1e4, 5.36e5, 9.126e6, etc.

    {
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "x3",
        "category": "normal",
        "search_space": {
            "mu": 8,
            "sigma": 4,
            "low": 0,
            "high": 10,
        }  #  some examples: 8.3, 7.5, 5.6, 7.9, etc.
    }

    {
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "x3_step",
        "category": "normal",
        "search_space": {
            "mu": 8,
            "sigma": 4,
            "low": 0,
            "high": 10,
            "step": 0.2,
        }
    }  #  some examples: 8.2, 8, 7.6, 5.6, etc.

    {
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "x4",
        "category": "lognormal",
        "search_space": {
            "mu": 1e-5,
            "sigma": 1e1,
            "low": 1e-7,
            "high": 1e-3,
            "base": 10,
        }
    }  #  some examples: 1.2e-5, 0.3e-6, 7.65e-4 etc.

    {
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "name": "x5",
        "category": "categorical",
        "search_space": {
            "values": ["a", "b", "c", "d"],
            "probabilities": [1 / 3, 1 / 3, 1 / 6, 1 / 6]
        }
    }  #  some examples: a, b, a, b, c, etc.

.. role:: red

- **algo**: *string* - Id of the algo
- **name**: *string* - Name of your hyperparameter
- **category**: *string*->[*enum*] - One of the following values depending on the type of your variable : ``categorical``, ``uniform``, ``loguniform``, ``normal``, ``lognormal``
- **search_space**: *dict* - Depending on the value of the 'category' field, the search_space dict can or must contain different keys. To know what to fill, look at the matching table below.

``step``, *if not specificated, will explore the search space in a continuous interval*

``base``, *is set at 10 by default*

+---------------+---------------+---------------+---------------+---------------+---------------+
|               | uniform       | loguniform    | normal        | lognormal     | categorical   |
+---------------+---------------+---------------+---------------+---------------+---------------+
| mu            | ``forbidden`` | ``forbidden`` | **mandatory** | **mandatory** | ``forbidden`` |
+---------------+---------------+---------------+---------------+---------------+---------------+
| sigma         | ``forbidden`` | ``forbidden`` | **mandatory** | **mandatory** | ``forbidden`` |
+---------------+---------------+---------------+---------------+---------------+---------------+
| low           | **mandatory** | **mandatory** | **mandatory** | **mandatory** | ``forbidden`` |
+---------------+---------------+---------------+---------------+---------------+---------------+
| high          | **mandatory** | **mandatory** | **mandatory** | **mandatory** | ``forbidden`` |
+---------------+---------------+---------------+---------------+---------------+---------------+
| step          |  *optional*   |  *optional*   |  *optional*   |  *optional*   | ``forbidden`` |
+---------------+---------------+---------------+---------------+---------------+---------------+
| base          | ``forbidden`` |  *optional*   | ``forbidden`` |  *optional*   | ``forbidden`` |
+---------------+---------------+---------------+---------------+---------------+---------------+
| values        | ``forbidden`` | ``forbidden`` | ``forbidden`` | ``forbidden`` | **mandatory** |
+---------------+---------------+---------------+---------------+---------------+---------------+
| probabilities | ``forbidden`` | ``forbidden`` | ``forbidden`` | ``forbidden`` |  *optional*   |
+---------------+---------------+---------------+---------------+---------------+---------------+

Trial
-----

Here is an example of an **Trial** object

.. code-block:: json

    {
        "id": "d188b0e6-9080-415d-be78-57efe8589a80",
        "algo_name": "sklearn-svm",
        "algo": "0597ca48-66f7-42be-9021-12ec57d4251e",
        "comment": "Pretty much nothing",
        "created": "2018-11-07T17:01:27.292336Z",
        "experiment": "6616120a-28b2-4c8b-a1c6-7f18c639632c",
        "owner": "bender_admin",
        "parameters": {
            "C": 0.07699688616826196,
            "kernel": "poly"
        },
        "results": {
            "test_accuracy": 1,
            "test_cohen_kappa": 1,
            "train_accuracy": 0.97,
            "train_cohen_kappa": 0.9546896239238786
        },
        "weight": 1
    }

- **algo** : *string* - Id of the algo
- **algo_name** : *string* - Name of the algo
- **comment** : *string* - Something to say about this trial
- **created** : *string* - Date of creation
- **experiment** : *string* - Id of the experiment
- **id** : *string* - Id of the trial
- **owner** : *string* - Owner of the experiment
- **parameters** : *dict* - Values of hyperparameters used for this trial
- **results** : *dict* - Metric results for this trial.
- **weight** : *number* - optional Importance of this trial compared to the others (default 1)