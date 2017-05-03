function p = pSequence( sequence )
% pSequence computes the negative natural logarithm of the probability 
% of a sequence of characters given a text corpus

global corpus

p = -log(sum(corpus == sequence(1)) / length(corpus));

if length(sequence) == 1
    return
end

p = p - log(pConditional(sequence(2), sequence(1)));

if length(sequence) == 2
    return
end

for i = 3:length(sequence)
    
    p = p - log(pConditional(sequence(i), sequence(1:i-1)));
    
end

end

