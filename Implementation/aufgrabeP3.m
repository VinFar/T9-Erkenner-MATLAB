% *** DATA PREPROCESSING ***

% Clear workspace and console, close all figures
clear all;
close all;
clc;

% Load data
load 'data.mat';

% Define example key sequence.
keySequence = '2345';

% Compute length of key sequence
nKeySequence = length(keySequence);

% Initialise string array that stores the sets of possible output symbols
% for each individual key of the key sequence
symbolSets = strings(size(keySequence));

% Map individual keys to possible output symbols
for i = 1:length(keySequence)
    
    symbolSets(i) = string(dictionary(keySequence(i)));
    
end

symbolSets

% Generate all possible combinations of output symbols, given the sequence
% above
% combinations = char(combvec(char(symbolSets(1)), char(symbolSets(2)), ...
%   char(symbolSets(3)))) %, char(symbolSets(4))

% Declare an empty tree structure
symbolTree = tree('');

indices = 1;


for i = 1 : nKeySequence
    
    currentSymbolSet = char(symbolSets(i));
    nCurrentSymbolSet = length(currentSymbolSet);
    
    indicesBuffer = [];
    
    for k = 1 : length(indices)
        
        indicesAdded = zeros(size(currentSymbolSet));
        
        for j = 1 : nCurrentSymbolSet
            
            [symbolTree, indicesAdded(j)] = symbolTree.addnode(indices(k), strcat(symbolTree.get(indices(k)), currentSymbolSet(j)));
            
        end
        
        indicesBuffer = [indicesBuffer indicesAdded];
        
    end
    
    indices = indicesBuffer;
    
    % Display tree structure
    % disp(symbolTree.tostring)
    
    % fprintf('\n\nPress any key to continue ...\n\n');
    
end

% Display tree structure
disp(symbolTree.tostring)


symbolTree