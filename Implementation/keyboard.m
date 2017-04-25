% *** DATA PREPROCESSING ***

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

% Load data
load 'data/dataEnglish.mat';

% Declare an empty tree structure
symbolTree = tree('');

% Initialise arrays
previousIndices = 1;
nodeIndices = {0 0}';
keySequence = [];
newKey = [];

% Instantiate keyboard object and store handle
keyFig = t9key;


