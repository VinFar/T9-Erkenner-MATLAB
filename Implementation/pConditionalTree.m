function p = pConditionalTree( y, x, probTree)
%pConditional computes the conditional probability of the character y given
%the sequence of charachters x

% Compute conditional probability
[frequencyXY, frequencyX] = getFrequency(probTree, [x, y], 1);

p =  frequencyXY / frequencyX;

% If denominator is zero the result is NaN in which case we will return 0.
if isnan(p)
    p = 0;
end

end

