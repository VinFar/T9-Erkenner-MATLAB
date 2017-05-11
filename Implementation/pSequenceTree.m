function p = pSequenceTree(probTree, sequence)
% pSequence computes the negative natural logarithm of the probability 
% of a sequence of characters given a text corpus

[frequency, ~]= getFrequency(probTree, sequence, 1);

rootCell = probTree.get(1);
N = rootCell{2};

p = frequency / N;

end

