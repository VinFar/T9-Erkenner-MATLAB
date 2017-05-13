function p = pSequenceTreeRecTrunc( probTree, sequence, currentIndex, nGram)
% pSequence computes the negative natural logarithm of the probability
% of a sequence of characters given a text corpus

n = length(sequence);

% Only one character or unigram
if n == 1 || nGram == 1
    
    newChar = sequence(end);
    condition = '';
    
else
    newChar = sequence(end);
    condition = sequence(max(1, end-nGram+1):end-1);
end

p = - log(pConditionalTree(newChar, condition, probTree));

if n == 1
    return
end

p = p + pSequenceTreeRecTrunc(probTree, sequence(1:end-1), currentIndex, nGram);

end