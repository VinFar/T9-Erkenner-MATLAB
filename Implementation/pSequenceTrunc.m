function p = pSequence( sequence )
% pSequenceTrunc computes the probability of a sequence of characters given a
% text corpus truncating each factor after two past characters

global corpus

p = sum(corpus == sequence(1)) / length(corpus);

if length(sequence) == 1
    return
end

p = p * pConditional(sequence(2), sequence(1));

if length(sequence) == 2
    return
end

for i = 3:length(sequence)
    
    p = p * pConditional(sequence(i), sequence(i-2:i-1));
    
end

end

