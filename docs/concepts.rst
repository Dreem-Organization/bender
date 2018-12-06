Concepts
########

With Bender, you create **Algos** within **Experiments**, and ask Bender some **Suggestions** of Hyperparameters to try for these **Algos**, benchmark your algo with these hyperparameters, and then submit the results as a **Trial**.

You can then compare the **Trials** to get the best set of Hyper-Parameters for a given  **Algo** or compare your **Algos** and get the best results possible for your **Experiment** !

Sounds complex ? It isn't ! Take a look below for the vocabulary ;)

Experiment
**********

An **Experiment** is closely tied to a problem.

You want for example to recognize automatically handwritten digits? That is a problem: you can create an **Experiment** for example named *digits_recogition*.

You want to find the shortest path to go somewhere? That's another problem: therefore you create another **Experiment**.

Every experiment has an unique id in the form of: ``0597ca48-66f7-42be-9021-12ec57d4251e``

Every bender client allows you to create, load or delete an **Experiment**, just check out the specific documentation to learn how.

Algo
****

An Algo is simply a way to respond to an experiment: a way to answer the given problem.

Getting back to our example of digit recognition problem, there is plenty different ways to solve the problem: one would be a certain kind of neural network, another would be a random forest algorithm, etc.

Some are better than others but Bender is here to maximise the performances of each **Algo** and allows you to also compare them to find the best way to answer your **Experiment**.

For each **Algo** you want to specify a set of Hyperparameters that Bender will optimize. These parameters
can be the learning rate of your neural network, the number of trees in your random forest, etc.


Trial
*****

A **Trial** is Bender's food. To train Bender on an Algo you created, he needs data to improve himself.

Each time you try a set of Hyperparameters, you want to make Bender know about it, also giving him a performance indicator associated with this Hyper Parameters set (a loss, an accuracy, etc.).

In short: a **Trial** is a Hyperparameters set associated with a performance metric.


Suggestion
**********

Of course it's not up to you to decide which Hyperparameters to use or not. Just ask Bender to give you some new ones: that is a **Suggestion**.

Therefore you can automate the whole process of optimizing your hyperparameters efficiently and quicky.
