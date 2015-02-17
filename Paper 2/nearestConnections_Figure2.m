function [connectivity, dendrites] = nearestConnections_Figure2(positions, x, dendrites)
%{
    This program will determine connections that are nearest neighbor
    for various neural networks.  A connectivity matrix and dendritic
    distances are returned from calling this function, although no files
    are written.

    Max Henderson
    Drexel University
    September 30, 2013
%}

%% Determine dendrite matrix of neurons.
numNeurons = length(positions);
connectivity = zeros(numNeurons);

%% Find x nearest neighbors to connect for each neuron.
copy = dendrites;
copy = copy + eye(numNeurons)*10000000;
for i = 1:numNeurons,
   for j = 1:x,
      a = find(copy(i,:)==min(copy(i,:)));
      if length(a) > 1,
          a = a(1);
      end
      connectivity(i,a) = 1;
      copy(i,a) = 10000000;
   end
end
