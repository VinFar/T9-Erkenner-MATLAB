

clear all;
close all;
clc;
%clr; clear all;close all; clear command

filename = 'englishTest.txt'

key = {'0' '1' '2' '3' '4' '5' '6' '7' '8' '9' '#'}';

valueKey = {
    '0'
    '1.,'
    '2abc'
    '3def' 
    '4ghi' 
    '5jkl' 
    '6mno'
    '7pqrs'
    '8tuv'
    '9wxyz'
    '_'          % symbol for a space
    };

%valukey from cell to char list (alphabet)
alphabet = char(strjoin(valueKey,'')); 
key_char = char(strjoin(key,''));

% key input -> key output compare
dictionary = containers.Map(key,valueKey);

%read corpus
corpus = fileread(filename);

corpus = lower(corpus);

%Umlaute!!!!!
corpus = strrep(corpus,sprintf('ä'),'ae');
corpus = strrep(corpus,sprintf('ü'),'ue');
corpus = strrep(corpus,sprintf('ö'),'oe');
corpus = strrep(corpus,sprintf('ß'),'ss');

%replace \r;\t;\n; sign that not in alphabet
corpus(~ismember(corpus,alphabet)) = ' ';

%replace double space
corpus = regexprep(corpus,' +',' ');
%corpus = regexprep(corpus,'  ',' ');
corpus = regexprep(corpus,' ','_');



nKeys = length(key);
corpusLength = length(corpus);

corpusNumber = corpus;

%save clean corpus 
%'w'-> Open or create new file for writing. 
%->Discard existing contents, if any.
fileID = fopen([filename(1:end-4),'Clean.txt'],'w');
fprintf(fileID,corpus);

%exchange letter with key number
for i = 1 : corpusLength
    
    for j = 1 : nKeys
        
        if ismember(corpusNumber(i), char(dictionary(key{j})))
            %casten weg lassen
            corpusNumber(i) = key_char(j);
            j = nKeys+1; %jump out loop
        end
        
    end
end


%save parameter/ corpus/ corpusNumber      .mat -> default
%'*' wildcard
save([filename(1:end-4),'Clean'],'*');

    %...
    %'alphabet','corpus','corpuslength','corpusNumber',...
    %'dictionary', 'filename','key','key_char',...
    %'nKeys','valueKey'...
    %);










