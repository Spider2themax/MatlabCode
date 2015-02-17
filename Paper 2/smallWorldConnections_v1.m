function [] = smallWorldConnections_v1(positions, x, randDir, p, dendrites)
%{
    This program will take an input file containing 3D points for where the
    soma's of the neurons in the neural network will be placed.  In this 
    connectivity scheme, we will connect X nearest neighbors and then
    randomly reassign connections according to probability p.

    Max Henderson
    Drexel University
    Feb 17, 2013
%}

%% Determine connectivity matrix of neurons.
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

%% Now, according to p, swap random connections.
done = 0;
for i = 1:numNeurons,
    for j = 1:numNeurons,
        if connectivity(i,j) > 1,
            if rand(1,1) < p,
                while done < 1,
                    newIndex = ceil(numNeurons*rand(1,1));
                    if newIndex ~= j && newIndex ~= i && connectivity(i,newIndex) ~= 1,
                        connectivity(i,j) = 0;
                        connectivity(i,newIndex) = 1;
                        done = 1;
                    end
                end
                done = 0;
            end
       end
    end
end

%% Write connections and dendrites to files.
n1 = sprintf('%s/Connections%d.txt', randDir, p*10);        
edit 'n1';          
dlmwrite(n1, connectivity);
n2 = sprintf('%s/Dendrites.txt', randDir);  
edit 'n2';          
dlmwrite(n2, dendrites);