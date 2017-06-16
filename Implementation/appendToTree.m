    function [symbolTree,index] = appendToTree(newKey, symbolTree, probTree, nGram)
    %appenToTree appends all possible output symbols corresponding to the
    % character newKey to the symbolTree
    
    global previousIndices;
    global dictionary;
    global cap;
    global probSymbol;
    global previousprobString;

    probSymbol = Inf(2, 5);
    index=zeros(10);

    % Extract current symbol set
    currentSymbolSet = dictionary(newKey);

    % Initialise buffer that holds indices
    indicesBuffer = [];

    i = 1;
    for previousIndex = previousIndices
        % Initialise buffer that holds newly added indices
        indicesAdded = zeros(size(currentSymbolSet));

        for j = 1:length(currentSymbolSet)
            
            currentSymbol = currentSymbolSet(j);

            % Extract character sequence and probability
            previousChars = symbolTree.Node{previousIndex,1}{1,1};

            % Capitalise
            if cap == 0
                newChar = currentSymbol;
            elseif cap == 1
                newChar = upper(currentSymbol);
            end

            % Character vector containing all previous and the current symbol
            newChars = strcat(previousChars, newChar);


            % Compute probability of the current symbol using a n-gram
            p = pSequence(probTree, newChars, 1, nGram);

            % Combine both node properties in a cell array and set boolean
            % to zero
            nodeContent = {newChars, p, 0};
            
            prev = getparent(symbolTree,previousIndex); %correct that there is no paren node of root node
            if prev == 0
                prev = 1;
            end
            
            
            if p == Inf || symbolTree.Node{prev,1}{1,3} == 0 %don't add a node if the probality is zero or
                                                             %the boolean
                                                             %is zero
                % if symbolTree.Node{prev,1}{1,3} == 0 %%%DEBUG
                % sprintf('boolean was 0 at ');
                % prev
                % end
            else
                % Add node to tree
                [symbolTree, indicesAdded(j)] = symbolTree.addnode(previousIndex, nodeContent);
                probString(1, i) = p;
                probString(2, i) = indicesAdded(j);
                i = i + 1;
                
                %decide wether its the first going through of symbolTree
                if probSymbol(2, j) ~= Inf
                    prev = probSymbol(2, j);
                else
                    prev = indicesAdded(j);
                end
                
                %if log of probability of the added node is bigger than the node
                %of the same element, then store it in probSymbol and
                %set the boolean for active/notactive
               
                p = -log(pConditional(currentSymbol,previousChars,probTree)); %delete this line if
                %you want to get the complete sequence probability
                
                if probSymbol(1, j) > p
                    probSymbol(1, j) = p;
                    probSymbol(2, j) = indicesAdded(j);
                   
                         symbolTree = symbolTree.set(indicesAdded(j), {symbolTree.Node{indicesAdded(j), 1}{1, 1}, symbolTree.Node{indicesAdded(j), 1}{1, 2}, 1});

                    if prev ~= indicesAdded(j)
                        symbolTree = symbolTree.set(prev, {symbolTree.Node{prev, 1}{1, 1}, symbolTree.Node{prev, 1}{1, 2}, 0});
                    end
                end
            end
        end

        if any(indicesAdded)
            indicesAdded = indicesAdded(indicesAdded ~= 0); %only add the indices that were added as a node
            indicesBuffer = [indicesBuffer indicesAdded];
        else

        end


    end

    %extract the probability of the each level of the tree and store it in
    %a string and delete zeros in this string
    probStringupper = probString(1, :); %upper is the probability
    probStringlower = probString(2, :); %and lower is the node
    zerosprobString = (probStringupper == Inf);
    probStringupper(zerosprobString) = [];
    probStringlower(zerosprobString) = [];

    %sort elements of the probability String and print it out
    [sorted, index] = sort(probStringupper);
    index = probStringlower(index);
    
    
    if length(index) >= 3 %short the K-Amount to 3 results
      index=index(1:3);
    end
    index = flip(index);
    index; %these are the nodes with the highest probability
    format compact
    % print sorted sequnces
   
    % sprintf('ausgabe vorher');
    for i=index     %set the boolean of this results to 1, to set them active and print them
       symbolTree = symbolTree.set(i, {symbolTree.Node{i, 1}{1, 1}, symbolTree.Node{i, 1}{1, 2}, 1});
       symbolTree.Node{i,1}; 
    
    end
    
    % Store indices of previous nodes global
    previousIndices = indicesBuffer;
    previousprobString = probString;

    end