function [] = nearestConnections_v1(positions, x, randDir, dendrites)
%{
    This program will take an input file containing 3D points for where the
    soma's of the neurons in the neural network will be placed.  In this 
    connectivity scheme, we will connect X nearest neighbors.

    Max Henderson
    Drexel University
    November 19, 2012
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

%% Write connections, dendrites, and somatic positions to files.
n1 = sprintf('%s/Connections1.txt', randDir);        
edit 'n1';          
dlmwrite(n1, connectivity);
n2 = sprintf('%s/Dendrites.txt', randDir);  
edit 'n2';          
dlmwrite(n2, dendrites);
