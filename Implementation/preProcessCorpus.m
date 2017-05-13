% *** preProcessCorpus.m ***

% Preprocess text corpus and save it at .mat-file


% Clear workspace and console, close all figures
clear all;
close all;
clc;


% Specify filename
fileName = 'german.txt';

% Define possible input symbols
keySet = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '#'}';

% Define possible output symbols
symbolSet = { ...
    '0' ...
    '1.,' ...
    '2abc' ...
    '3def' ...
    '4ghi' ...
    '5jkl' ...
    '6mno' ...
    '7pqrs' ...
    '8tuv' ...
    '9wxyz' ...
    '_' ... % symbol for a space
    }';

% Compose entire key set and alphabet
alphabet = char(join(symbolSet, ''));
keys = char(join(keySet, ''));

% Create input -> output map
dictionary = containers.Map(keySet, symbolSet);

% Compute number of keys
nKeys = dictionary.Count;

% Read text corpus
corpus = fileread(fileName);

% Convert to lowercase
corpus = lower(corpus);

% Repace umlauts
corpus = strrep(corpus, sprintf('ä'),'ae');
corpus = strrep(corpus, sprintf('ü'),'ue');
corpus = strrep(corpus, sprintf('ö'),'oe');
corpus = strrep(corpus, sprintf('ß'),'ss');

% Replace dashes
corpus = strrep(corpus, '-', ' ');

% Replace newlines
corpus = strrep(corpus, newline, ' ');

% Replace carriage returns
corpus = strrep(corpus, sprintf('\r'), ' ');

% Replace tabs
corpus = strrep(corpus, sprintf('\t'), ' ');

% Remove whitespace by replacing multiple spaces with a single one
corpus = regexprep(corpus, ' +', ' ');

% Replace spaces with underscores
corpus = strrep(corpus, ' ', '_');

% Compute length of corpus
corpusLength = length(corpus);

% Replace characters that are not in the alphabet with '$'
corpus(~ismember(corpus, alphabet)) = '$';

% Open text file to print to
fileID = fopen(['../Corpora/', fileName(1:end-4), 'Clean.txt'], 'w');
fprintf(fileID, corpus);

% Initialise array that stores the corpus comprised of the respective keys
% that map to each output symbol.
corpusByKeys = corpus;

% Iterate over all keys
for j = 1 : nKeys
    
    % Reverse map symbols to corresponding keys
    corpusByKeys(ismember(corpus, dictionary(keySet{j}))) = keySet{j};
    
end

% Save workspace variables to file
save(['../Corpora/', fileName(1:end-4), 'Clean'], ...
    'alphabet', 'corpus', 'corpusByKeys', 'corpusLength', ...
    'dictionary', 'fileName', 'keys', 'keySet', 'nKeys', 'symbolSet' ...
    );