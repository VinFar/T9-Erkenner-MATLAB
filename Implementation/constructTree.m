% *** CONSTRUCT TREE ***

% Clear workspace and console, close all figures
clear all;
close all;
clc;

global keySequence;
global newKey;
global symbolTree;
global dictionary;
global previousIndices;
global nodeIndices;
global cap;
global corpus

% Load corpus
load('englishClean.mat');

% Declare an empty tree structure
symbolTree = tree({'_', 1, length(strfind(corpus, '_'))});

% Initialise arrays
previousIndices = 1;
nodeIndices = {0 0}';
keySequence = [];
newKey = [];

% Instantiate keyboard object and store handle
keyFig = gui;


