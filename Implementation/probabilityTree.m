% *** PROBABILITY TREE ***

% Clear workspace and console, close all figures
clear all;
close all;
clc;

corpus = 'das_ist_langweilig_ja_das_ist_es_und_ich_will_ins_bett';
n = 6;

pauseFor = 1;
dispTree = true;

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

