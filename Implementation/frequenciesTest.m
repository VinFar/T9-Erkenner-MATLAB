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

%sequence = 'hallo';
sequence = 'in_steinfurt_regnet_es_fast_nie'

[frequency prevFrequency] = getFrequency(probTree, sequence, 1)

relFrequency = pSequenceTree(probTree, sequence)

relFrequencyRec = exp(-pSequenceTreeRec( probTree, sequence, 1))

relFrequencyRecTrunc = exp(-pSequenceTreeRecTrunc( probTree, sequence, 1, 2))

pCond = pConditionalTree('o', 'hall', probTree)






