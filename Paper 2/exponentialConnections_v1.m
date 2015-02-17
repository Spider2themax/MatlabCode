function Y = exponentialConnections_v1(positions, numConnections, randDir, current, Y, dendrites)
%{
    This program will take an input file containing 3D points for where the
    soma's of the neurons in the neural network will be placed.  In this 
    connectivity scheme, we will connect to X of the potential neighbors, 
    with higher probabilities of connectivity for closer neurons.

    Max Henderson
    Drexel University
    November 19, 2012
%}

%% Determine connectivity matrix of neurons.
numNeurons = length(positions);
connectivity = zeros(numNeurons);
averageDistance = sum(sum(dendrites))/(numNeurons*numNeurons - numNeurons);

%% Determine connectivity matrix of neurons which depends on distances.
connectivity = zeros(numNeurons);
x = -averageDistance/(log(numConnections/numNeurons)*Y);
for i = 1:numNeurons,   
    for j = 1:numNeurons,    
        probConnection = exp(-dendrites(i,j)/x);  
        if probConnection > rand(1,1),   
            connectivity(i,j) = 1;
        end
    end 
end
connectivity = connectivity - eye(numNeurons);
while sum(sum(connectivity))/numNeurons < numConnections,
    connectivity = zeros(numNeurons); 
    Y = Y*0.97;
    x = -averageDistance/(log(numConnections/numNeurons)*Y);
    for i = 1:numNeurons,   
        for j = 1:numNeurons,  
            probConnection = exp(-dendrites(i,j)/x);  
            if probConnection > rand(1,1),
                    connectivity(i,j) = 1;
            end
        end
    end
    for i = 1:numNeurons,
        connectivity(i,i) = 0;
    end
end

%% Make sure every neuron has at least one connection.
copy = dendrites;
copy = copy + eye(numNeurons)*10000000;
for i = 1:numNeurons,
    if sum(connectivity(i,:)) == 0,
        a = find(copy(i,:)==min(copy(i,:)));
        if length(a) > 1,
          a = a(1);
        end
        connectivity(i,a) = 1;
    end
    for i = 1:numNeurons,
        connectivity(i,i) = 0;
    end
end

%% Eliminate connections until the average number of connections are met.
totalConnections = sum(sum(connectivity));
idealConnections = numNeurons*numConnections;
while totalConnections > idealConnections,
    rowIndex = ceil(numNeurons*rand(1,1));
    columnIndex = ceil(numNeurons*rand(1,1));
    if connectivity(rowIndex,columnIndex) == 1,
        if sum(connectivity(rowIndex,:)) > 1,
           connectivity(rowIndex,columnIndex) = 0; 
        end
    end
    totalConnections = sum(sum(connectivity));
end

%% Write connections and dendrites to file.
n1 = sprintf('%s/Connections%d.txt', randDir, current);            
edit 'n1';          
dlmwrite(n1, connectivity);
n2 = sprintf('%s/Dendrites.txt', randDir);            
edit 'n2';          
dlmwrite(n2, dendrites);