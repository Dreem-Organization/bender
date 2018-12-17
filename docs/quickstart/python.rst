Python
######

The **python client for bender** is available with the ``pip install bender-client`` command.

You can find a full tutorial on the github repo of the package at: `github.com/Dreem-Organization/Bender-Client <https://github.com/Dreem-Organization/Bender-Client>`_.

Here is a minimal example:

.. code:: python

    """ In this minimal example we try to minimize the sinus function between 0 and 2pi"""

    from benderclient import Bender
    import numpy as np

    # Initialize Bender
    bender = Bender()

    # Create an experiment
    bender.create_experiment(
        name='Minimum example experiment',
        description='Find minimum of sinus function',
        metrics=[{"metric_name": "sinus_value", "type": "loss"}],
    )

    # Create an algo (here the sinus function with one parameter)
    bender.create_algo(
        name='Analytic sinus function',
        hyperparameters=[
            {
                "name": 'x',
                "category": "uniform",
                "search_space": {
                    "low": 0,
                    "high": 2 * np.pi,
                },
            },
        ]
    )

    # Ask bender for values to try
    for _ in range(50):
        # Get a set of Hyperparameters to test
        suggestion = bender.suggest(metric="sinus_value", optimizer="parzen_estimator")

        # Run the sinus function
        sinus_value = np.sin(suggestion["x"])

        # Feed Bender a trial
        bender.create_trial(
            hyperparameters=suggestion,
            results={"sinus_value": sinus_value}
        )
        print("x: ", suggestion["x"], " value :", sinus_value)
