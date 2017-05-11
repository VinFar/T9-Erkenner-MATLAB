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
disp(horzcat(charTree.tostring, freqTree.tostring))

sequence = 'hallo';

frequency = getFrequency(probTree, sequence, 1)

