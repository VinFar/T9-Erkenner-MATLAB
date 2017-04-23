function appendToTree(newKey)

global previousIndices;
global symbolTree;
global dictionary;

% Extract current symbolSet and compute length
currentSymbolSet = dictionary(newKey);
nCurrentSymbolSet = length(currentSymbolSet);

% Store new indices
indicesBuffer = [];

for k = 1 : length(previousIndices)
    
    indicesAdded = zeros(size(currentSymbolSet));
    
    for j = 1 : nCurrentSymbolSet
        
        [symbolTree, indicesAdded(j)] = symbolTree.addnode(previousIndices(k), strcat(symbolTree.get(previousIndices(k)), currentSymbolSet(j)));
        
    end
    
    indicesBuffer = [indicesBuffer indicesAdded];
    
end

% Store indices of previous nodes
previousIndices = indicesBuffer;

% Display tree structure
disp(symbolTree.tostring)

end