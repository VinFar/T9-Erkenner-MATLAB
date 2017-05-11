function [charTree, freqTree] = appendRec(charTree, freqTree, sample, currentIndex, pauseFor, dispTree)
%APPENDREC Recursively append to tree
%   Detailed explanation goes here

sampleLength = length(sample);

% Get indices of all children of the first node
childrenIndices = getchildren(charTree, currentIndex);

% Initialise vector of characters that holds all children
children = '';

% Get characters
for i = childrenIndices
    childrenChars = charTree.get(i);
    children = [children, childrenChars(1)];
end

% If the first character of a sample does not exist in the first layer
% of the tree append the entire sample to the first node
if ~any(children == sample(1))
    
    newIndexChar = currentIndex;
    newIndexFreq = currentIndex;
    for j = 1:sampleLength
        [charTree, newIndexChar] = charTree.addnode(newIndexChar, sample(j));
        [freqTree, newIndexFreq] = freqTree.addnode(newIndexFreq, 1);
        
        if dispTree
            fprintf('\n\n');
            disp(charTree.tostring)
            pause(pauseFor)
        end
    end
    
end

if any(children == sample(1))
    
    currentIndex = childrenIndices(children == sample(1));
    oldChars = charTree.get(currentIndex);
    charTree = charTree.set(currentIndex, [oldChars, oldChars(1)]);
    
    oldFreq = freqTree.get(currentIndex);
    freqTree = freqTree.set(currentIndex, oldFreq + 1);
    
    if dispTree
        fprintf('\n\n');
        disp(charTree.tostring)
        pause(pauseFor)
    end
    
    if sampleLength > 1
        
        [charTree, freqTree] = appendRec(charTree, freqTree, sample(2:end), currentIndex, pauseFor, dispTree);
    
    end
    
end

end

