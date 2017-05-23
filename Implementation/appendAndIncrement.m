function [probTree] = appendAndIncrement(probTree, sample, currentNodeIndex)
%APPENDREC recursively appends symbols of a sequence to the tree and count
% occurences

%Get the length of sample
sampleLength = length(sample);

% Get indices of all children of the current node
%die indizes in der tabelle "probTree" werden in childrenindices
%gespeichert
childrenIndices = getchildren(probTree, currentNodeIndex);

% Initialise vector of characters that holds all children
children = '';

% Append all characters of children
%mit der forschleife wird jedes feld von childrenindices durchgegangen und
%nacheinander in childindex gespeichert, sodass beim erreichen der letzten
%spalte von childrenindices die for schleife abgebrochen wird und am ende
%in children die wortfolge steht
%d.h. die jeweilige ebene wird komplett durchgegangen und children
%gespeichert


characterExists = 0;
for childIndex = childrenIndices
    childCell = probTree.get(childIndex); %Zelle der Stelle "childindex" extrahieren und in chhildcell schreiben
    children = [children, childCell{1}];
        if sample(1) == children(end)
            characterExists = 1;
            
        break
        end
end

% Check whether the first character of the sample exists on the current
% level of the tree
%prüfe ob in dieser ebene schon der erste buchstabe von sample enthalten
%ist. speichere dieses binäre arry in characterexists
% characterExists = any(children == sample(1));



% If not append the entire samples one below the other to the current node
%wenn in characterexits eine 1 steht, also der buchstabe schon vorhanden
%war springe nicht in die if schleife
if ~characterExists
    
    newIndex = currentNodeIndex;
    
    for currentChar = sample
        %[probTree, newIndex] = probTree.addnode(newIndex, {currentChar, 1});
        [probTree, newIndex] = probTree.addnode(newIndex, {currentChar,1,(1/probTree.Node{1,1}{1,2})});
    end
    
end


parentfreq =0;
childfreq = 0;


if characterExists
    
    % Find the index of the character
    currentNodeIndex = childrenIndices(children == sample(1));
    
    % Extract the old count and add it incremented by one
    oldContent = probTree.get(currentNodeIndex);
    
    [childfreq parentfreq]= getFrequency(probTree,sample,1);
    
%     parentfreq = probTree.Node{getparent(probTree,currentNodeIndex),1}{1,2};
%     childfreq = getFrequency(probTree,sample,1);
%     parentfreq = getFrequency(probTree,sample(1:(end-1),1);
%     sample
%     parentfreq
%     childfreq
%     parentfreq = getFrequency(probTree,sample(1:end-1))
 
    probTree = probTree.set(currentNodeIndex, {oldContent{1}, oldContent{2} + 1,oldContent{3}*(childfreq/parentfreq)});
    
    %probTree = probTree.set(currentNodeIndex, {oldContent{1}, oldContent{2} + 1,(2)});
    % Step one layer below and append the remaining sample
    if sampleLength > 1
        [probTree] = appendAndIncrement(probTree, sample(2:end), currentNodeIndex);
    else
        return
    end
    
end

end