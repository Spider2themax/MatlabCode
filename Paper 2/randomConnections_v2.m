function [] = randomConnections_v2(positions, numConnections, randDir, current, Dend)
%{
    This program will take an input file containing 3D points for where the
    soma's of the neurons in the neural network will be placed.  In this 
    connectivity scheme, neurons will be connected randomly. The parameter
    x will define the probability that neuron x will remain connected to 
    neuron y.

    Max Henderson
    Drexel University
    December 12, 2012
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

%% Grow the dendritic tree for each neuron in the network.
%Dend = zeros(1,7);
%for i = 1:numNeurons,
%    Dend = adjustDendrites(Dend, positions, connectivity, i);
%    if i == 1,
%        Dend = Dend(2:length(Dend),:);
%    end
%end

%% Write connections and dendrites to file.
n1 = sprintf('%s/Connections%d.txt', randDir, current);            
edit 'n1';          
dlmwrite(n1, connectivity);
n2 = sprintf('%s/Dendrites.txt', randDir);            
edit 'n2';          
dlmwrite(n2, Dend);