% *** DATA PREPROCESSING ***


% Clear workspace and console, close all figures
clear all;
close all;
clc;


% Select language: 'German' or 'English'
language = 'English';

% Specify filename for respective text corpus obtained from
% http://wortschatz.uni-leipzig.de/en/download
switch language
    
    case 'English'
        filename = 'eng_news_2015_10K-words.txt';
        
    case 'German'
        filename = 'deu_news_2015_10K-words.txt';
        
    otherwise
        error('No valid language selected! Choose English or German!');
end

% Define possible input symbols
keySet = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}'; %, '*', '#'}';

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
    % "+" ...             % switch between upper and lowercase
    % "_" ...             % symbol for a space
    }';

% Compose entire alphabet
alphabet = char(join(valueSet, ''));
keys = char(join(keySet, ''));

% Create input -> output map
dictionary = containers.Map(keySet, valueSet);

% Compute number of keys
nKeys = dictionary.Count;

% Read text corpus
fileID = fopen(filename);
corpus = textscan(fileID, '%d %s %s %d', 'Delimiter',{'\t'});
fclose(fileID);

% Extract only the words from the corpus
wordsRawCell = corpus{2};

% Store words as an array of strings
wordsRaw = string(wordsRawCell);

% Compute the number of words in the raw corpus
nWordsRaw = length(wordsRaw);

for index = 1:nWordsRaw
    
    % Mark records that consist of characters not contained in the alphabet
    if sum(~ismember(char(wordsRaw(index)), alphabet)) ~= 0
        wordsRaw(index) = "-----";
    end
    
end

% Extract words containing only character existing in the alphabet
words = wordsRaw(wordsRaw ~= "-----");

% Convert all strings to lowercase
words = lower(words);

% Compute number of words
nWords = length(words);

% Partition the training and test set. Use hold-out p = 30%
partition = cvpartition(nWords, 'HoldOut', 0.3);

% Alternatively:
% Divide the observations into k disjoint subsamples (or folds), chosen
% randomly but with roughly equal size.
% partition = cvpartition(nWords, 'KFold', 10);

% Choose first fold in case of k-fold partitioning and extract indices for
% training and test samples
idxTrain = training(partition, 1);
idxTest = test(partition, 1);

% Compose train and test sets
trainSet = words(idxTrain);
testSet = words(idxTest);

% Compute number of samples
nTrainSet = length(trainSet);
nTestSet = length(testSet);

% Define array that stores words comprised of its individual characters
% mapped to input symbols
wordsInputSym = strings(size(words));

for k = 1 : nWords
    
    word = char(words(k));
    
    for i = 1 : length(word)
        
        character = word(i);
        
        for j = 1 : nKeys
            
            if ismember(character, char(dictionary(keySet{j})))
                character = keys(j);
            end
            
        end
        
        word(i) = character;
        
    end
    
    wordsInputSym(k) = string(word);
    
end

% Save workspace variables to file
save('data', 'alphabet', 'dictionary', 'nKeys', 'nTestSet', 'nTrainSet', 'nWords', ...
    'testSet', 'trainSet', 'valueSet', 'words', 'wordsInputSym');

