
% Partition the training and test set. Use hold-out p = 30%
partition = cvpartition(corpusLength, 'HoldOut', 0.3);

% Alternatively:
% Divide the observations into k disjoint subsamples (or folds), chosen
% randomly but with roughly equal size.
% partition = cvpartition(corpusLength, 'KFold', 10);

% Choose first fold in case of k-fold partitioning and extract indices for
% training and test samples
idxTrain = training(partition, 1);
idxTest = test(partition, 1);

% Compose train and test sets
trainSet = corpus(idxTrain);
testSet = corpus(idxTest);

% Compute number of samples
nTrainSet = length(trainSet);
nTestSet = length(testSet);