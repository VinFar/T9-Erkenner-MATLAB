% *** PROBABILITY TREE ***

% Clear workspace and console, close all figures
clear all;
close all;
clc;


% Specify filename
fileName = 'english';

% Load corpus
%load([fileName, 'Clean.mat']);

%corpus = 'das_ist_langweilig_ja_das_ist_es_und_ich_will_ins_bett';
corpus = 'das_geht_ja_gut_das_geht_ja_schlecht';

% Tree depth
n = 7;

% Debug
pauseFor = 1;
dispTree = false;

% Initialise tree
probTree = tree('ROOT');

for index = 1 : length(corpus) - n
    
    if dispTree
        % Display tree structure
        fprintf('\n\n');
        fprintf('Index: %d', index);
        fprintf('\n\n');
        disp(probTree.tostring)
    end
    
    pause(pauseFor)
    
    % Extract a n-element long sample of the corpus
    sample = corpus(index:index+n-1);
    
    probTree = appendRec(probTree, sample, 1, pauseFor, dispTree);
    
end

% Display tree structure
fprintf('\n\n')
disp(probTree.tostring)

% Save probability tree to file
save(['../Corpora/', fileName, 'ProbabilityTree'], 'probTree');


