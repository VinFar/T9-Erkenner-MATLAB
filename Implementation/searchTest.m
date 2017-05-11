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


%sequence = '_ja_gut';
%sequence = 'ut_das_';
sequence = 'l';

content = getFrequency(charTree, freqTree, sequence, 1, pauseFor, dispTree )

