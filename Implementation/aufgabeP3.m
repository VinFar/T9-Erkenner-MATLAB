% *** DATA PREPROCESSING ***

% Clear workspace and console, close all figures
clear all;
close all;
clc;

% Load data
load 'data/dataEnglish.mat';

% Define example key sequence.
keySequence = '234';

% Compute length of key sequence
nKeySequence = length(keySequence);

% Initialise string array that stores the sets of possible output symbols
% for each individual key of the key sequence
symbolSets = strings(size(keySequence));

% Map individual keys to possible output symbols
for i = 1:length(keySequence)
    
    symbolSets(i) = string(dictionary(keySequence(i)));
    
end

% Declare an empty tree structure
symbolTree = tree('');

% Initialise array that stores indices of previous nodes
previousIndices = 1;
nodeIndices = {0 0}';

for i = 1 : nKeySequence
    
    % Extract current symbolSet and compute length
    currentSymbolSet = char(symbolSets(i));
    nCurrentSymbolSet = length(currentSymbolSet);
    
    % Store ne
    indicesBuffer = [];
    
    for k = 1 : length(previousIndices)
        
        indicesAdded = zeros(size(currentSymbolSet));
        
        for j = 1 : nCurrentSymbolSet
            
            [symbolTree, indicesAdded(j)] = symbolTree.addnode(previousIndices(k), strcat(symbolTree.get(previousIndices(k)), currentSymbolSet(j)));
            
        end
        
        indicesBuffer = [indicesBuffer indicesAdded];
        
    end
    
    % Store indices of previous nodes
    previousIndices = indicesBuffer;
    
    % Store indices of each level of depth
    nodeIndices{i} = previousIndices;
    
end

% Display tree structure
disp(symbolTree.tostring)

% Display number of node of the tree
fprintf("\n\n");
fprintf("Tree depth: %10.0d\n", symbolTree.depth);
fprintf("Number of nodes: %5.0d\n", nnodes(symbolTree));