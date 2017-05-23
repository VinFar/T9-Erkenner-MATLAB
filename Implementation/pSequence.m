function p = pSequence( probTree, sequence, currentIndex, nGram)
% PSEQUENCE computes the negative natural logarithm of the probability
% of a sequence of characters given a probability tree.
%   nGram specifies the number of conditional characters. nGram = 1 uses
%   an unigram, that is only the current character determines the
%   probability. nGram = 2 uses a bigram considering one previous character
%   and so forth.

% Only one character or unigram
if length(sequence) == 1 || nGram == 1
    
    newChar = sequence(end);
    condition = '';
    
else
    
    newChar = sequence(end);
    
    %example:
    %condition(in_steinfurt) -> P(t|ur) mit n-gram 3
    condition = sequence(max(1, end - nGram + 1):end-1);
    
end

% Compute negativ natural logarithm of conditional probability
% h(a,x) / h(x)
p = - log(pConditional(newChar, condition, probTree));

if length(sequence) == 1
    return
end

% Call pSequence with the sequence shortened by the last character
p = p + pSequence(probTree, sequence(1:end-1), currentIndex, nGram);

end