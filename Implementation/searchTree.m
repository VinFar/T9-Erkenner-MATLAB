function [ content ] = searchTree( probTree, sequence, currentIndex, pauseFor, dispTree )
%SEARCHTREE Summary of this function goes here
%   Detailed explanation goes here

n = length(sequence);

% Get indices of all children of the first node
childrenIndices = getchildren(probTree, currentIndex);

% Initialise vector of characters that holds all children
children = '';

% Get characters
for i = childrenIndices
    childrenChars = probTree.get(i);
    children = [children, childrenChars(1)];
end

if ~any(children == sequence(1))
    
    content = '$';
    
elseif any(children == sequence(1))
    
    currentIndex = childrenIndices(children == sequence(1));
    
    if n == 1
        
        content = probTree.get(currentIndex);
        return
        
    end
    
    content = searchTree(probTree, sequence (2:n), currentIndex, pauseFor, dispTree );
    
end

end


