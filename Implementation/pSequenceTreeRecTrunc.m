function p = pSequenceTreeRecTrunc( probTree, sequence, currentIndex, truncAfter)
% pSequence computes the negative natural logarithm of the probability
% of a sequence of characters given a text corpus

n = length(sequence);

% If length of sequence = 1 only one character exists and there is no
% condition
if n == 1
    
    newChar = sequence(1);
    condition = '';
    
    % Else if the sequence has at least two elements and the number of
    % elements in the condition + 1 is larger than the sequence
elseif n - truncAfter - 1 < 1
    
    newChar = sequence(end);
    condition = sequence(1:end-1);
    
else
    
    newChar = sequence(end);
    condition = sequence(end-truncAfter-1:end-1);
    
end

p = - log(pConditionalTree(newChar, condition, probTree));

if n == 1
    
    return
    
end

p = p + pSequenceTreeRec(probTree, sequence(1:end-1), currentIndex);

end