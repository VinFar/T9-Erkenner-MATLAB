function [ frequency, frequencyPrarentNode] = getFrequency(probTree, ...
    sequence, currentIndex)
% GETFREQUENCY returns the frequence of a sequence of characters by
% searching a given probability tree
%   freqParentNode is the frequency stored at the parent node and represents
%   the frequency of occurence of the sequence shortened by one character

% Get indices of all children of the first node
%currentIndex in pconditional = 1
childrenIndices = getchildren(probTree, currentIndex);

% Initialise vector of characters that holds all children
children = '';

% Get characters
for child = childrenIndices
    childContent = probTree.get(child);
    children = [children, childContent{1}];
end

% Check whether the first character of the sample exists on the current
% level of the tree
characterExists = any(children == sequence(1));

if ~characterExists
    
    frequency = 0;
    
    % Set frequency to the number of characters used to construct the tree.
    % There id no specific reason so far. This could by any other number <= 0.
    contentParentNode = probTree.get(1);
    frequencyPrarentNode = contentParentNode{2};
    
elseif characterExists
    
    % Get the index of the existing character
    currentIndex = childrenIndices(children == sequence(1));
    
    if length(sequence) == 1
        
        % Get node content and extract frequency
        nodeContent = probTree.get(currentIndex);
        frequency = nodeContent{2};
        
        % Get parent node content and extract frequency
        contentParentNode = probTree.get(getparent(probTree, currentIndex));
        frequencyPrarentNode = contentParentNode{2};
        return
        
    end
    
    % Call getFrequency with the sequence shortened by the first character
    [frequency, frequencyPrarentNode] = getFrequency(probTree, ...
        sequence (2:end), currentIndex);
    
end

end