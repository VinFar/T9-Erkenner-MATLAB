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

sequence = 'll';

frequency = getFrequency(probTree, sequence, 1)

relFrequency = pSequenceTree(probTree, sequence)

pCond = pConditionalTree('o', 'hall', probTree)

[frequency prevFrequency] = getFrequency(probTree, 'hallo', 1)



