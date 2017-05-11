% *** PROBABILITY TREE ***

% Clear workspace and console, close all figures
clear all;
close all;
clc;



pauseFor = 0;
dispTree = false;

load('englishProbabilityTree.mat')

% Display tree structure
fprintf('\n\n')
disp(probTree.tostring)


sequence = '_ja_gut';
sequence = 'ut_das_';
sequence = 'hal';

content = searchTree(probTree, sequence, 1, pauseFor, dispTree )

