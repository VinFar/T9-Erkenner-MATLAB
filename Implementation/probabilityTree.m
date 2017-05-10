% *** PROBABILITY TREE ***

% Clear workspace and console, close all figures
clear all;
close all;
clc;

corpus = 'das_ist_langweilig_das_ist_es';
n = 4;

% Open text file to print to
    fileID = fopen('test.txt','w');

% Initialise tree
probTree = tree('_');

for index = 1 : length(corpus) - n
    
    % Extract a n-element long sample of the corpus
    sample = corpus(index:index+n);
    
    % Get indices of all children of the first node
    firstChildrenIndices = getchildren(probTree, 1);
    
    % Initialise vector of characters that holds all children
    firstChildren = '';
    
    % Get characters
    for i = firstChildrenIndices
        firstChildrenChars = probTree.get(i);
        firstChildren = [firstChildren, firstChildrenChars(1)];
    end
    
    % If the first character of a sample does not exist in the first layer
    % of the tree append the entire sample to the first node
    if ~any(firstChildren == sample(1))
        
        newIndex = 1;
        for j = 1:n
            [probTree, newIndex] = probTree.addnode(newIndex, sample(j));
        end
    end
    
    if any(firstChildren == sample(1))
        
        currentIndex = firstChildrenIndices(firstChildren == sample(1));
        oldChars = probTree.get(currentIndex);
        probTree = probTree.set(currentIndex, [oldChars, oldChars(1)]);
        
        % Get indices of all children of the first node
        secondChildrenIndices = getchildren(probTree, currentIndex);
        
        % Initialise vector of characters that holds all children
        secondChildren = '';
        
        % Get characters
        for i = secondChildrenIndices
            secondChildrenChars = probTree.get(i);
            secondChildren = [secondChildren, secondChildrenChars(1)];
        end
        
        % If the first character of a sample does not exist in the first layer
        % of the tree append the entire sample to the first node
        if ~any(secondChildren == sample(2))
            
            newIndex = currentIndex;
            for h = 2:n
                [probTree, newIndex] = probTree.addnode(newIndex, sample(h));
            end
        end
        
        if any(secondChildren == sample(2))
            
            currentIndex = secondChildrenIndices(secondChildren == sample(2));
            oldChars = probTree.get(currentIndex);
            probTree = probTree.set(currentIndex, [oldChars, oldChars(1)]);
            
            % Get indices of all children of the third node
            thirdChildrenIndices = getchildren(probTree, currentIndex);
            
            % Initialise vector of characters that holds all children
            thirdChildren = '';
            
            % Get characters
            for i = thirdChildrenIndices
                thirdChildrenChars = probTree.get(i);
                thirdChildren = [thirdChildren, thirdChildrenChars(1)];
            end
            
            % If the third character of a sample does not exist in the third layer
            % of the tree append the entire sample to the third node
            if ~any(thirdChildren == sample(3))
                
                newIndex = currentIndex;
                for l = 3:n
                    [probTree, newIndex] = probTree.addnode(newIndex, sample(l));
                end
            end
            
            if any(thirdChildren == sample(3))
                
                currentIndex = thirdChildrenIndices(thirdChildren == sample(3));
                oldChars = probTree.get(currentIndex);
                probTree = probTree.set(currentIndex, [oldChars, oldChars(1)]);
                
                % Get indices of all children of the third node
                fourthChildrenIndices = getchildren(probTree, currentIndex);
                
                % Initialise vector of characters that holds all children
                fourthChildren = '';
                
                % Get characters
                for i = fourthChildrenIndices
                    fourthChildrenChars = probTree.get(i);
                    fourthChildren = [fourthChildren, fourthChildrenChars(1)];
                end
                
                % If the third character of a sample does not exist in the third layer
                % of the tree append the entire sample to the third node
                if ~any(fourthChildren == sample(4))
                    
                    newIndex = currentIndex;
                    for l = 4:n
                        [probTree, newIndex] = probTree.addnode(newIndex, sample(l));
                    end
                end
                
                if any(fourthChildren == sample(4))
                    
                    currentIndex = fourthChildrenIndices(fourthChildren == sample(4));
                    oldChars = probTree.get(currentIndex);
                    probTree = probTree.set(currentIndex, [oldChars, oldChars(1)]);
                end
                
            end
            
        end
        
    end
    
    % Display tree structure
    fprintf('\n\n');
    fprintf('Index: %d', index);
    fprintf('\n\n');
    disp(probTree.tostring)
    
    pause(2)
    
end

% Display tree structure
fprintf('\n\n')
disp(probTree.tostring)

