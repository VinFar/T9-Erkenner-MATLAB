function symbolTree = appendToTree(newKey, symbolTree, probTree, nGram)
%appenToTree appends all possible output symbols corresponding to the 
% character newKey to the symbolTree

global previousIndices;
global dictionary;
global cap;

% Extract current symbol set
currentSymbolSet = dictionary(newKey);

% Initialise buffer that holds indices
indicesBuffer = [];

for previousIndex = previousIndices
    
    % Initialise buffer that holds newly added indices
    indicesAdded = zeros(size(currentSymbolSet));
    
    for j = 1:length(currentSymbolSet)
        
        currentSymbol = currentSymbolSet(j);
        
        % Get cell array attached to previous node
        previousNodeContent = symbolTree.get(previousIndex);
        
        % Extract character sequence and probability
        previousChars = previousNodeContent{1, 1};
        
        % Capitalise
        if cap == 0
            newChar = currentSymbol;
        elseif cap == 1
            newChar = upper(currentSymbol);
        end
        
        % Character vector containing all previous and the current symbol
        newChars = strcat(previousChars, newChar);
        
        % Compute probability of the current symbol using a n-gram
        p = exp(-pSequence(probTree, newChars, 1, nGram));
        
        % Combine both node properties in a cell array
        nodeContent = {newChars, p};
        
        % Add node to tree
        [symbolTree, indicesAdded(j)] = symbolTree.addnode(previousIndex, nodeContent);
        
    end
    
    indicesBuffer = [indicesBuffer indicesAdded];
    
end

% Store indices of previous nodes
previousIndices = indicesBuffer;

end