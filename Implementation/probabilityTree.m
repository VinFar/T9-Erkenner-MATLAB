% *** PROBABILITY TREE ***

% Clear workspace and console, close all figures
clear all;
close all;
clc;


% Specify filename
fileName = 'english';

% corpus = 'das_ist_langweilig_ja_das_ist_es_und_ich_will_ins_bett';
% corpus = 'das_geht_ja_gut_das_geht_ja_schlecht';
corpus = 'halli_hallo_hallele';

% Load corpus
%load([fileName, 'Clean.mat']);

% Tree depth
n = 5;

% Debug
pauseFor = 1;
dispTree = true;

% Initialise tree
probTree = tree('ROOT');

% Iterate over entire corpus
for index = 1 : length(corpus) - n
    
    % Debug
    if dispTree
        % Display tree structure
        fprintf('\n\n');
        fprintf('Index: %d', index);
        fprintf('\n\n');
        disp(probTree.tostring)
        pause(pauseFor)
    end
    
    % Extract a n-element long sample of the corpus
    sample = corpus(index:index+n-1);
    
    probTree = appendRec(probTree, sample, 1, pauseFor, dispTree);
    
end

% Display tree structure
fprintf('\n\n')
disp(probTree.tostring)

% Save probability tree to file
save(['../Corpora/', fileName, 'ProbabilityTree'], 'probTree');

