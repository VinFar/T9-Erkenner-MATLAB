% *** BUCHSTABENWAHRSCHEINLICHKEITEN ***


% Clear workspace and console, close all figures
clear all;
close all;
clc;

global corpus

% Load corpus
load('englishClean.mat');

% Set text interpreter, axes interpreter, and legend interpreter to 'LaTeX'
set(groot, 'defaultTextInterpreter', 'latex');
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(groot, 'defaultlegendInterpreter', 'latex');
set(0, 'DefaultFigureWindowStyle', 'docked');

% Initialise vector that holds individual frequencies
frequencies = zeros(size(alphabet));

% Compute frequency of each character in the alphabet
for i = 1:length(alphabet)
    
    frequencies(i) = sum(corpus == alphabet(i));
    
end

% Add missing character '$'
% Frequencies(end + 1) = sum(corpus == '$');

% Compute relative frequencies
relativeFrequencies = frequencies ./ corpusLength;

% Plot relative frequencies
stem(relativeFrequencies)
labels = cell(size(alphabet));
for i = 1:length(labels)
    labels{i} = alphabet(i);
end
xticks(1:length(alphabet))
xticklabels(labels)
xlabel("Characters");
ylabel("Relative frequencies");

% Constitute a few combinations for testing purposes
comb = nchoosek(alphabet(10:20), 2);

% Add another arbitrary combination
comb(end + 1, :) = 'xy';

% Initialise vector that holds individual frequencies of each combination
frequenciesComb = zeros(1, length(comb));

% Compute frequency of each combination of characters
for i = 1:length(comb)
    
    frequenciesComb(i) = length(strfind(corpus, comb(i, :)));
    
end

% Compute relative frequencies
relativeFrequenciesComb = frequenciesComb ./ corpusLength;

% Plot relative frequencies
figure();
stem(relativeFrequenciesComb)
labels = cell(1, length(comb));
for i = 1:length(labels)
    labels{i} = comb(i, :);
end
xticks(1:length(comb))
xticklabels(labels)
xlabel("Character Combinations");
ylabel("Relative Frequencies Combinations");

pConditional('s', 'thi')
