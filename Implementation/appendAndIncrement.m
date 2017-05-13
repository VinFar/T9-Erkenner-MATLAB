function [probTree] = appendAndIncrement(probTree, sample, currentNodeIndex)
%APPENDREC recursively appends symbols of a sequence to the tree and count
% occurences

sampleLength = length(sample);

% Get indices of all children of the current node
childrenIndices = getchildren(probTree, currentNodeIndex);

% Initialise vector of characters that holds all children
children = '';

% Append all characters of children
for childIndex = childrenIndices
    childCell = probTree.get(childIndex);
    children = [children, childCell{1}];
end

% Check whether the first character of the sample exists on the current
% level of the tree
characterExists = any(children == sample(1));

% If not append the entire samples one below the other to the current node
if ~characterExists
    
    newIndex = currentNodeIndex;
    
    for currentChar = sample
        [probTree, newIndex] = probTree.addnode(newIndex, {currentChar, 1});
    end
    
end

if characterExists
    
    % Find the index of the character
    currentNodeIndex = childrenIndices(children == sample(1));
    
    % Extract the old count and add it incremented by one
    oldContent = probTree.get(currentNodeIndex);
    probTree = probTree.set(currentNodeIndex, {oldContent{1}, oldContent{2} + 1});
    
    % Step one layer below and append the remaining sample
    if sampleLength > 1
        [probTree] = appendAndIncrement(probTree, sample(2:end), currentNodeIndex);
    else
        return
    end
    
end

end