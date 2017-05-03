% *** WAHRSCHEINLICHKEIT EINER BUCHSTABENFOLGE ***


% Clear workspace and console, close all figures
clear all;
close all;
clc;

global corpus

% Load corpus
load('germanClean.mat');

sequence = 'wenn_ich_nicht_fest_darauf_rechnete'
%sequence = 'in_steinfurt_regnet_es_fast_nie'
%sequence = '_dies_ist_die_berechnete_wahrscheinlichkeit_eines_satzes_der_genau_hundert_sinnlose_zeichen_umfasst_'


pProductLn = pSequence(sequence)
pProduct = exp(-pProductLn)

pProductTruncLn = pSequenceTrunc(sequence)
pProductTrunc = exp(-pProductTruncLn)

pRelFreq = length(strfind(corpus, sequence)) / corpusLength


