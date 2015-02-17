function [C, numNeighbors] = CommonNeighborConnect(C, N)

%{
    This program will 

    Max Henderson
    December 28, 2013
    Drexel University
%}

%% Determine numbers of common neighors.
numNeighbors = CommonNeighborsNetwork(C, N);
totalCon = sum(sum(C));

%% Once number of neighbors is determined, iteratively reconnect neurons.
numIteration = 20;
CC = zeros(numIteration,1);
cc = clustering_coef_bu(C);
avg_cc = mean(cc);
CC(1) = avg_cc;
for i = 1:numIteration,
    % Reconnect neurons based off common neighbors.
    C = ReconnectCommonNeighbors(C, N, numNeighbors, totalCon);
    % Recalculate common neighbors of this new connectivity matrix.
    numNeighbors = CommonNeighborsNetwork(C, N);
    % Update the clustering coefficient of the new network.
    cc = clustering_coef_bu(C);
    avg_cc = mean(cc);
    CC(i+1) = avg_cc;
end
plot(linspace(1, length(CC), length(CC)), CC)