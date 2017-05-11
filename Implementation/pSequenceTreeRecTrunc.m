function p = pSequenceTreeRecTrunc( probTree, sequence, currentIndex, truncAfter)
% pSequence computes the negative natural logarithm of the probability
% of a sequence of characters given a text corpus

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
    freqPrevNode = probTree.get(1);
    p = Inf;
    
elseif any(childrenChar == sequence(1))
    
    if n <= truncAfter + 1
        
        currentIndex = childrenIndices(childrenChar == sequence(1));
        
        nodeContent = probTree.get(currentIndex);
        frequency = nodeContent{2};
        contentPrevNode = probTree.get(getparent(probTree, currentIndex));
        freqPrevNode = contentPrevNode{2};
        
        p = - log(frequency / freqPrevNode);
        
        if n == 1
            
            return
            
        end
        
    else
        
        p = 0;
        
    end
    
    p = p + pSequenceTreeRec(probTree, sequence (2:n), currentIndex);
    
end

end


