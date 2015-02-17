function [connectivity, Dend] = randomConnections_Figure2(positions, numConnections, Dend)
%{
    This program will determine connections that are random
    for various neural networks.  A connectivity matrix and dendritic
    distances are returned from calling this function, although no files
    are written.

    Max Henderson
    Drexel University
    September 30, 2013
%}

%% Determine connectivity matrix of neurons.
numNeurons = length(positions);
connectivity = zeros(numNeurons);
currentConnections = 0;
for i = 1:numNeurons,
   while currentConnections < numConnections,
      newConnection = ceil(numNeurons*rand(1,1));
      if i ~= newConnection && connectivity(i,newConnection) == 0,
          connectivity(i,newConnection) = 1;
          currentConnections = currentConnections + 1;
      end
   end
   currentConnections = 0;
end