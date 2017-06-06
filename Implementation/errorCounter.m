% fehlerzähler mit test korpus
% test korpus wird in tasten umgewandelt und mit dem T9-Erkenner wieder
% zurück gewandelt
% Ausgabe wird mit ursprünglichen Text verglichen und unterschiede erkannt
% Fehlerrate = Fehler / test_korpus_länge

clear all;
close all;
clc;

global keySequence
global newKey
global symbolTree
global dictionary
global previousIndices
global nodeIndices
global probTree
global cap
global nGram

% Initialise tree structure
symbolTree = tree({'_', 1,1});

% set cap for appendToTree
cap = 0;

% Initialise arrays
previousIndices = 1;
nodeIndices = {0 0}';
keySequence = [];
newKey = [];
nGram = 3;

% define language
language = 'german';

%load corpus clean
load([language,'Clean.mat']);

%load prob Tree
load([language,'ProbabilityTree.mat']);

% Test sequence
% test_sequence = corpus(10000:10200);
test_sequence = 'hallo_ich_komme_aus_steinfurt_und_studiere_elektro';

key_sequence = test_sequence;

for j = 1 : nKeys
    
key_sequence(ismember(test_sequence, dictionary(keySet{j}))) = keySet{j};

end

for j = 1 : length(key_sequence)
    
    newKey = num2str(key_sequence(j));
    
    keySequence = [keySequence, newKey];
    
    [symbolTree,index] = appendToTree(newKey, symbolTree, probTree, nGram);

end
    
    prov_sequence = symbolTree.Node{index(length(index)),1}{1, 1};
    error_rate = 0;
    inco_sign = 0;
    
    for j =  2 : length(test_sequence)
       if(prov_sequence(j+1) ~= test_sequence(j))
           inco_sign = inco_sign + 1;
       end
    end
    
    error_rate = inco_sign / length(test_sequence)
    
    
    
    
  