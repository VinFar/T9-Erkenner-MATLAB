% *** constructProbabilityTree ***

% Counts frequencies of occurrence for sequences of characters using the
% corpus and stores them in a tree structure


% Clear workspace and console, close all figures
clear all;
close all;
clc;

% Specify language
language = 'german';

% Specify depth of tree
treeDepth = 3;

% Load corpus
load([language, 'Clean.mat']);

% Use only 10 000 characters for testing
corpus = corpus(1:200000);

% Initialise tree
probTree = tree({'_', length(corpus)});

% Iterate over entire corpus
for index = 1 : length(corpus) - treeDepth
    
    % Extract a n-element long sample of the corpus
    sample = corpus(index:index+treeDepth-1);
    
    % Append sample to tree
    probTree = appendAndIncrement(probTree, sample, 1);
    
end

% Save variables to file
save(['../Corpora/', fileName(1:end-4), 'ProbabilityTree'], ...
    'probTree', 'alphabet', 'treeDepth', 'dictionary', 'fileName', ...
    'keySet', 'symbolSet' ...
    );