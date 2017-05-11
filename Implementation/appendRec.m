function [ probTree ] = appendRec( probTree, sample, currentIndex, pauseFor, dispTree )
%APPENDREC Recursively append to tree
%   Detailed explanation goes here

n = length(sample);

% Get indices of all children of the first node
childrenIndices = getchildren(probTree, currentIndex);

% Initialise vector of characters that holds all children
children = '';

% Get characters
for i = childrenIndices
    childrenChars = probTree.get(i);
    children = [children, childrenChars(1)];
end

% If the first character of a sample does not exist in the first layer
% of the tree append the entire sample to the first node
if ~any(children == sample(1))
    
    newIndex = currentIndex;
    for j = 1:n
        [probTree, newIndex] = probTree.addnode(newIndex, sample(j));
        
        if dispTree
            fprintf('\n\n');
            disp(probTree.tostring)
            pause(pauseFor)
        end
    end
    
end

if any(children == sample(1))
    
    currentIndex = childrenIndices(children == sample(1));
    oldChars = probTree.get(currentIndex);
    probTree = probTree.set(currentIndex, [oldChars, oldChars(1)]);
    
    if dispTree
        fprintf('\n\n');
        disp(probTree.tostring)
        pause(pauseFor)
    end
    
    if n > 1
        
        probTree = appendRec(probTree, sample(2:end), currentIndex, pauseFor, dispTree);
        
    end
    
end

end

