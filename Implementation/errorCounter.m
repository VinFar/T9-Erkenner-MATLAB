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
nGram = 5;

% define language
language = 'german';

% load prob Tree
% load([language,'ProbabilityTree.mat']);
load('all_6.mat');

% load corpus clean
load([language,'TestClean.mat']);

% Test sequence
 test_sequence = corpus(1:500);
% test_sequence = 'hallo_ich,_komme_aus._hallo_ich_komme_aus';

% initialise 
key_sequence = test_sequence;
prov_sequence = '';

% change to key_sequence for t9
for j = 1 : nKeys
    
key_sequence(ismember(test_sequence, dictionary(keySet{j}))) = keySet{j};

end

% get keys into append to tree
for j = 1 : 1 : length(key_sequence)
    
    if (key_sequence(j) ~= '1')
    newKey = num2str(key_sequence(j)); 
    keySequence = [keySequence, newKey];
    [symbolTree,index] = appendToTree(newKey, symbolTree, probTree, nGram);   
    
    else
    newKey = num2str(key_sequence(j)); 
    keySequence = [keySequence, newKey];
    [symbolTree,index] = appendToTree(newKey, symbolTree, probTree, nGram);
    
    prov_buffer = symbolTree.Node{index(length(index)),1}{1, 1};
    prov_sequence = [prov_sequence,prov_buffer];
    
    symbolTree = tree({'', 1,1});
    previousIndices = 1;
    nodeIndices = {0 0}';
    keySequence = [];
    newKey = [];
    
    end
    
end
    
  % wenn nicht mit punkt oder komma abgeschlossen wird
   if(key_sequence(end) ~= '1')
   prov_buffer = symbolTree.Node{index(length(index)),1}{1, 1};
   prov_sequence = [prov_sequence,prov_buffer];
   end
    
    error_rate = 0;
    inco_sign = 0;
    
     for j =  1 : length(test_sequence)
      if(prov_sequence(j+1) ~= test_sequence(j))
           inco_sign = inco_sign + 1;
      end
     end
     
     

    error_rate = inco_sign / length(test_sequence)
    
    
    
    
  