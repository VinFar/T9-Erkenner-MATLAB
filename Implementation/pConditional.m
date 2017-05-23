function p = pConditional( y, x, probTree)
% pConditional returns the conditional probability of the character y given
% the sequence of characters x
%P(y|x) Wahrscheinlichkeit für y unter der Vorraussetzung von x

% Compute conditional probability
[frequencyXY, frequencyX] = getFrequency(probTree, [x, y], 1);

frequencyXY;
frequencyX;

p = frequencyXY / frequencyX;

% If denominator is zero the result is NaN in which case pConditional will 
% return 0
if isnan(p)
    p = 0;
end

end

