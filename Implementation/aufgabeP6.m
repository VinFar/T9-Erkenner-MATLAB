% *** WAHRSCHEINLICHKEIT EINER BUCHSTABENFOLGE ***


% Clear workspace and console, close all figures
clear all;
close all;
clc;

global corpus

% Load corpus
load('englishClean.mat');


pProductGet = pSequence('get')

pRelFreqGet = length(strfind(corpus, 'get')) / corpusLength

pProductSteinfurt = pSequence('Did it ever rain in Steinfurt?')

pRelFreqSteinfurt = length(strfind(corpus, 'Did it ever rain in Steinfurt?')) / corpusLength



