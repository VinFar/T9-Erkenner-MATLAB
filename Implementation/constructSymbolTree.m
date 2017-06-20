% *** constructSymbolTree.m ***

% Dynamically construct a tree by pressing keys on the GUI. The tree
% structure holds all possible combinations of output symbols corresponding
% to the key pressed

% Clear workspace and console, close all figures
clear all;
close all;
clc;

global keySequence
global newKey
global symbolTree
global dictionary
global previousIndices
global nodeIndices
global probTree
global cap
global nGram

% Set figure window style to normal to avoid the GUI being docked
set(0, 'DefaultFigureWindowStyle', 'normal');

% Load corpus
load('germanProbabilityTree.mat');

% Initialise tree structure
symbolTree = tree({'', 1,1});

% Initialise arrays
previousIndices = 1;
nodeIndices = {0 0}';
keySequence = [];
newKey = [];
nGram = 3;

% Instantiate keyboard object
keyFig = gui;
