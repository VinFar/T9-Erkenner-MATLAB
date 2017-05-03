function appendToTree(newKey)

global previousIndices;
global symbolTree;
global dictionary;
global cap;

% Extract current symbolSet and compute length
currentSymbolSet = dictionary(newKey);
nCurrentSymbolSet = length(currentSymbolSet);

% Store new indices
indicesBuffer = [];

for k = 1 : length(previousIndices)
    
    indicesAdded = zeros(size(currentSymbolSet));
    
    for j = 1 : nCurrentSymbolSet
        
        % Get cell array attached to previous node
        previousNodeContent = symbolTree.get(previousIndices(k));
        
        % Extract character sequence and probability
        previousChars = previousNodeContent{1, 1};
        previousP = previousNodeContent{1, 2};
        
        % Current character
        if cap == 0
            newChar = currentSymbolSet(j);
        elseif cap == 1
            newChar = upper(currentSymbolSet(j));
        end
        
        % Character vector containing all previous and the current symbol
        newChars = strcat(previousChars, newChar);
        
        % Conditional probability of the current symbol given the
        % previous symbols
        p = pConditional(newChar, previousChars);
        
        % Combine both node properties in a cell array
        nodeContent = {newChars, p};
        
        % Add node to tree
        [symbolTree, indicesAdded(j)] = symbolTree.addnode(previousIndices(k), nodeContent);
        
    end
    
    indicesBuffer = [indicesBuffer indicesAdded];
    
end

% Store indices of previous nodes
previousIndices = indicesBuffer;

% Display tree structure
disp(symbolTree.tostring)

end