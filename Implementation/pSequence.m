function p = pSequence( sequence )
% pSequence computes the probability of a sequence of characters given a
% text corpus

global corpus

p = sum(corpus == sequence(1)) / length(corpus);
 
for i = 2:length(sequence)
    
    p = p * pConditional(sequence(i), sequence(1:i-1));
    
end

end

