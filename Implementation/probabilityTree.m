% *** FREQUENCY TREE ***

% Stores frequencies of occurrence for sequences of characters in the
% corpus

% Clear workspace and console, close all figures
clear all;
close all;
clc;

% Specify filename
fileName = 'english';

% Specify depth of tree
depth = 5;

% corpus = 'das_ist_langweilig_ja_das_ist_es_und_ich_will_ins_bett';
% corpus = 'das_geht_ja_gut_das_geht_ja_schlecht';
corpus = 'halli_hallo_hallele';

% Load corpus
% load([fileName, 'Clean.mat']);

% Debug
pauseFor = 1;
dispTree = false;

% Initialise tree
charTree = tree('ROOT');
freqTree = tree(length(corpus));
probTree = tree({'_', length(corpus)});

% Iterate over entire corpus
for index = 1 : length(corpus) - depth
    
    % Debug
    if dispTree
        % Display tree structure
        fprintf('\n\n');
        fprintf('Index: %d', index);
        fprintf('\n\n');
        disp(freqTree.tostring)
        pause(pauseFor)
    end
    
    % Extract a n-element long sample of the corpus
    sample = corpus(index:index+depth-1);
    
    % Append sample to tree
    [charTree, freqTree, probTree] = appendRec(charTree, freqTree, probTree, sample, 1, pauseFor, dispTree);
end

% Display tree structure
fprintf('\n\n')
disp(horzcat(charTree.tostring, freqTree.tostring))

% Save probability tree to file
save(['../Corpora/', fileName, 'ProbabilityTree'], 'charTree', 'freqTree', 'probTree');

