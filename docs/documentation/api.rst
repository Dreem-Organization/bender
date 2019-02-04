API
######

**PLEASE READ THE 'CONCEPTS' DOCUMENTATION TAB FIRST IF IT'S YOUR FIRST TIME USING THE API**

Base route
**********

All routes starts with the following base : ``https://bender-api.dreem.com`` (of your own API address if you are running Bender yourself)

The Api is using JWT authentication so don't forget to sent the token in your request headers (You can get it with the login route).

**Make sure you already created a Bender account on** `the web client <https://bender.dreem.com/>`_ !

Login
*****

**POST** ``/login``

**Body**

.. code-block:: json

    {
        "email": "my@mail.com",
        "password": "mydeepestsecret",
    }

**Return**

.. code-block:: json

    {
        "token": "FNU87TR875R7IFO873F8E873T",
        "user": {
            "pk": 83,
            "username": "my_user", 
            "email": "my@mail.com", 
            "first_name": "my_first_name", 
            "last_name": "my_last_name", 
        }
    }

******************

Experiment methods
******************

List experiments
----------------

**GET** ``/api/experiments/?owner=<username_of_your_account>``

**Return**

.. code-block:: json

    {
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
            {
                "id": "0555ce2c-25b9-4804-b7a6-6fb6fb069e3a",
                "name": "MY_EXPERIMENT",
                "description": "none",
                "metrics": [
                    {
                        "type": "loss",
                        "metric_name": "A"
                    },
                    {
                        "type": "reward",
                        "metric_name": "B"
                    }
                ],
                "dataset": "MY_DATASET",
                "dataset_parameters": null,
                "trial_count": 6,
                "algo_count": 2,
                "owner": "MY_USERNAME",
                "participants": [
                    [
                        "MY_USERNAME"
                    ]
                ],
                "shared_with": [],
                "created": "2019-01-14T14:26:28.289729Z",
                "modified": "2019-01-14T14:26:28.289786Z"
            }
        ]
    }

Create experiment
-----------------

**POST** ``/api/experiments/``

**Body**

.. code-block:: json

    {
        "name": "my_experiment_name",
        "description": "my_experiment_description",
        "metrics": [{"metric_name": "metric_a","type": "reward" }, {"metric_name": "metric_b","type": "loss" }],
        "dataset": "my_dataset_name",
        "dataset_parameters": { "version": 0.1, "anything": "you_want" }
    }

**Return**

.. code-block:: json

    {
        "id": "fb2c7cb6-c1d9-4b4f-8547-9064485673aa",
        "name": "my_experiment_name",
        "description": "my_experiment_description",
        "dataset": "my_dataset_name",
        "dataset_parameters": {
            "version": 0.1,
            "anything": "you_want"
        },
        "metrics": [
            {
                "type": "reward",
                "metric_name": "metric_a"
            },
            {
                "type": "loss",
                "metric_name": "metric_b"
            }
        ]
    }

Delete experiment
-----------------

**DELETE** ``/api/experiments/<your_experiment_id>/``

**Return :**

*none*


************

Algo methods
************

List algos
----------------

**GET** ``/api/algos/?experiment=<experiment_id>``

**Return**

.. code-block:: json

    {
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
            {
                "id": "1221bd9c-634a-4257-9419-dce9fd7581ec",
                "name": "my_algo_name",
                "experiment": "e0a1c447-f7d9-43e3-8b8e-53aa2806db8d",
                "owner": "ibob",
                "parameters": [
                    {
                        "algo": "1221bd9c-634a-4257-9419-dce9fd7581ec",
                        "name": "param_name",
                        "category": "categorical",
                        "search_space": {
                            "values": [
                                3,
                                5,
                                7
                            ]
                        },
                        "category_display": "Categorical parameter"
                    }
                ],
                "description": "my_algo_description",
                "trial_count": 0,
                "created": "2019-01-21T14:40:14.429439Z",
                "modified": "2019-01-21T14:40:14.429471Z",
                "is_search_space_defined": true
            }
        ]
    }

Create algo
-----------

**POST** ``/api/algos/``

**Body**

.. code-block:: json

    {
        "name": "my_algo_name",
        "description": "my_algo_description",
        "parameters": [{"name": "param_name","category": "categorical", "search_space": { "values": [3, 5, 7] } }]
        "experiment": "your_experiment_id"
    }

**Return**

.. code-block:: json

    {
        "id": "1221bd9c-634a-4257-9419-dce9fd7581ec",
        "name": "my_algo_name",
        "experiment": "e0a1c447-f7d9-43e3-8b8e-53aa2806db8d",
        "description": "my_algo_description",
        "parameters": [
            {
                "name": "param_name",
                "category": "categorical",
                "search_space": {
                    "values": [
                        3,
                        5,
                        7
                    ]
                }
            }
        ],
        "is_search_space_defined": true
    }

Get suggestion from bender
--------------------------

**POST** ``/api/algos/<my_algo_id>/suggest``

**Body**

.. code-block:: json

    {
        "metric": "metric_a",
        "optimizer": "parzen_estimator"
    }

**Return**

.. code-block:: json

    {
        "param_name": 7
    }

Delete algo
-----------

**DELETE** ``/api/experiments/<your_algo_id>/``

**Return :**

*none*

**************

Trials methods
**************

List trials
-----------

**GET** ``/api/trials/?algo=<algo_id>``

**Return**

.. code-block:: json

    {
        "count": 1,
        "next": null,
        "previous": null,
        "results": [
            {
                "id": "adf5bf14-0fb1-4e96-8e37-ddd4e5c8f44b",
                "algo": "1221bd9c-634a-4257-9419-dce9fd7581ec",
                "experiment": "e0a1c447-f7d9-43e3-8b8e-53aa2806db8d",
                "owner": "ibob",
                "parameters": {
                    "param_name": 3
                },
                "results": {
                    "metric_a": 0.8,
                    "metric_b": 0.3
                },
                "comment": "anything_you_want_to_say",
                "algo_name": "my_algo_name",
                "created": "2019-01-21T14:52:40.069199Z",
                "modified": "2019-01-21T14:52:40.069230Z",
                "weight": 1
            }
        ]
    }

Create trial
------------

**POST** ``/api/trials/``

**Body**

.. code-block:: json

    {
        "algo": "my_algo_id",
        "description": "my_algo_description",
        "parameters": {"param1": "value","param2": 3567, "param3": "another"},
        "results": {"metric1": 0.8, "metric2": 0.3},
        "comment": "anything_you_want_to_say",
        "weight": 1
    }

**Return**

.. code-block:: json

    {
        "id": "adf5bf14-0fb1-4e96-8e37-ddd4e5c8f44b",
        "algo": "1221bd9c-634a-4257-9419-dce9fd7581ec",
        "parameters": {
            "param_name": 3
        },
        "results": {
            "metric_a": 0.8,
            "metric_b": 0.3
        },
        "comment": "anything_you_want_to_say",
        "weight": 1
    }

Delete trial
------------

**DELETE** ``/api/trails/<your_trial_id>/``

**Return :**

*none*