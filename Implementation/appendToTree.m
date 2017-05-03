function appendToTree(newKey)

global previousIndices;
global symbolTree;
global dictionary;
global corpus;
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
        previousCount = previousNodeContent{1, 3};
        
        % Current character
        if cap == 0
            newChar = currentSymbolSet(j);
        elseif cap == 1
            newChar = upper(currentSymbolSet(j));
        end
        
        % Character vector containing all previous and the current symbol
        newChars = strcat(previousChars, newChar);
        
        % Count of the number of occurences of the new sequence
        countNewChars = length(strfind(corpus, newChars));
        
        % Conditional probability of the current symbol given the
        % previous symbols
        p = countNewChars / previousCount;
        
        % If denominator is zero the result is NaN in which case we will return 0.
        if isnan(p)
            p = 0;
        end
        
        % Combine both node properties in a cell array
        nodeContent = {newChars, p, countNewChars};
        
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