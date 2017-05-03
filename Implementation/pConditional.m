function p = pConditional( y, x )
%PCOND Summary of this function goes here
%   Detailed explanation goes here
global corpus

% Compute conditional probability
p = length(strfind(corpus, [x, y])) / length(strfind(corpus, x));

% If denominator is zero the result is NaN in which case we will return 0.
if isnan(p)
    p = 0;
end

end
