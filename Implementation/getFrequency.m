function [ frequency ] = getFrequency( probTree, sequence, currentIndex)
%SEARCHTREE Summary of this function goes here
%   Detailed explanation goes here

n = length(sequence);

% Get indices of all children of the first node
childrenIndices = getchildren(probTree, currentIndex);

% Initialise vector of characters that holds all children
childrenChar = '';

% Get characters
for i = childrenIndices
    childrenContent = probTree.get(i);
    childrenChar = [childrenChar, childrenContent{1}];
end

if ~any(childrenChar == sequence(1))
    
    frequency = 0;
    
elseif any(childrenChar == sequence(1))
    
    currentIndex = childrenIndices(childrenChar == sequence(1));
    
    if n == 1
        
         nodeContent = probTree.get(currentIndex);
         frequency = nodeContent{2};
        return
        
    end
    
    frequency = getFrequency(probTree, sequence (2:n), currentIndex);
    
end

end


