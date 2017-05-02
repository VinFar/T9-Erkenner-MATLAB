% *** DATA PREPROCESSING ***


% Clear workspace and console, close all figures
clear all;
close all;
clc;


% Specify filename
fileName = 'english.txt';

% Define possible input symbols
keySet = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '#'}'; %, '*'}';

% Define possible output symbols
valueSet = { ...
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
    '_' ...          % symbol for a space
    }';

% Compose entire alphabet
alphabet = char(join(string(valueSet), ''));
keys = char(join(keySet, ''));

% Create input -> output map
dictionary = containers.Map(keySet, valueSet);

% Compute number of keys
nKeys = dictionary.Count;

% Read text corpus
corpus = fileread(fileName);

% Remove header
%k = strfind(corpus, 'PREFACE');
%corpus = corpus(k:end);

% Convert to lowercase
corpus = lower(corpus);

% Replace newlines
%corpus = corpus(corpus ~= newline);
corpus = strrep(corpus, newline, ' ');

% Replace carriage returns
%corpus = corpus(corpus ~= sprintf('\r'));
corpus = strrep(corpus, sprintf('\r'), ' ');

% Replace tabs
%corpus = corpus(corpus ~= sprintf('\t'));
corpus = strrep(corpus, sprintf('\t'), ' ');

% Remove multiple spaces
corpus = regexprep(corpus,' +',' ');

% Replace spaces with underscores
corpus = strrep(corpus, ' ', '_');

% Replace dashes with underscores
corpus = strrep(corpus, '-', '_');

% Compute length of corpus
corpusLength = length(corpus);

% Replace characters that are not in the alphabet with '$'
corpus(~ismember(corpus, alphabet)) = '$';

% Open text file to print to
fileID = fopen(['../Corpora/', fileName(1:end-4), 'Clean.txt'], 'w');
fprintf(fileID, corpus);

% Define array that stores words comprised of input symbols that map to the
% respective character.
corpusInputSym = corpus;

for i = 1 : corpusLength
    
    for j = 1 : nKeys
        
        if ismember(corpusInputSym(i), char(dictionary(keySet{j})))
            corpusInputSym(i) = keys(j);
        end
        
    end
    
end

% Save workspace variables to file
save(['../Corpora/', fileName(1:end-4), 'Clean'], ...
    'alphabet', 'corpus', 'corpusInputSym', 'corpusLength', 'dictionary', ...
    'fileName', 'keys', 'keySet', 'nKeys', 'valueSet' ...
    );

