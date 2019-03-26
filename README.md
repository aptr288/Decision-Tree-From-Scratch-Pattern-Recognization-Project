# Pattern-Recognization
Implementation of decision tree from the scratch based on entroy and information gain calculation.



1.1.main.m



This is the main
file where our program execution starts. We read our dataset and continue with
the following steps.



1.1.1.             
Different
methods like xlsread and readtable are employed to read data.  



1.1.2.             
If
the data contains categorical data, then we convert data from    categorical to numerical.



1.1.3.             
Spilt
data based for cross validation randomly each time. 



1.1.4.             
Send
the training data to recursive function decisionNodeSplit to build   the tree, splitconditions is the decision
tree obtained.



1.1.5.             
Sending
test data for prediction the labels and calculation performance.



1.1.6.             
Plot
decision tree.



 



4.2.categoricalToNumerical.m



This file takes
our dataset as input and convert all categorical data to numerical and stores
them in the form [features, label].



 



4.3.decisionNodeSplit.m



This function
takes our dataset, split condition and counter as input and build the decision
tree recursively and populating the split conditions and using counter for
denoting the depth of the tree. We iteratively split the dataset into left and
right nodes by splitting the dataset on data point of feature with highest
information gain across the dataset and so on till we reach the leaf nodes
which are pure. 



 



4.4.InfoGainAcrossFeatures.m



This function
takes our features list and labels as input and output as best feature and particular
data point on which we get highest gain as output. In this function we
calculate Information gain on each feature and then return feature with highest
gain among all these features.



 



4.5.InfoGainOnFeature.m



This function
takes our single feature and label as input and calculates on which point we get
highest entropy among the data points and returns the gain and point at which
we attained the highest gain.



 



4.6.calculate_Entropy.m



This function
takes a set of count of different input labels and calculates the entropy using
the equation  and return the value.



 



4.7.splitDataSet.m



This function
takes the dataset, split data point and the split column and divides the
dataset based on the split point and split column and returns children datasets
left and right.



 



4.8.purityCheck.m



This function
checks if the given datasets are unique or they are still impure, if the labels
are unique we return 1 and else 0. 

4.9.evaluation.m



This function
takes test set and tree structure as input and predicts the decisions and
returns all the results.



 



4.10.              
Predict.m



This function
takes our data instance to predict decision, tree structure and index.  We traverse decision tree reclusively and arrive
at the leaf to return the decision.
