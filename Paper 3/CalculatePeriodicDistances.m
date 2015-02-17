function D = CalculatePeriodicDistances(N, pos, a, xyz)

%{
    This program will determine the intersomatic distances between neurons
    in the network using periodic boundary conditions, assuming isotropic
    connectivity.

    INPUT
    
    N : Number of neurons in network
    pos : Positions of neurons in respective network
    a : length of one side of the cubic volume in which all neurons reside
    xyz = 1     :   Return z-distances
    xyz = 2     :   Return xy-distances
    xyz = 3     :   Return xyz-distances

    Max Henderson
    Last updated: Sept. 14, 2014
    Drexel University
%}

%% Make copies of network to surround network for periodic BC.
totalNeurons = zeros(27*N,4); % Total neurons keeps track of ALL neurons, as well as duplicate neuron copies
count = 1;
for i = 0:2,
    for j = 0:2,
        for k = 0:2,
            totalNeurons(count:count+N-1,1) = linspace(1,N,N);
            totalNeurons(count:count+N-1,2) = pos(1:N,1)+i*a;
            totalNeurons(count:count+N-1,3) = pos(1:N,2)+j*a;
            totalNeurons(count:count+N-1,4) = pos(1:N,3)+k*a;
            count = count + N;
        end
    end
end

%% Find the closest neural distance between each pair of neurons.
D = zeros(N) + 100000;
if xyz == 1, % Distances in z-direction...
    for i = 1:length(totalNeurons) - 1,
       for j = i + 1:length(totalNeurons),
          dend = sqrt((totalNeurons(i,4)-totalNeurons(j,4))^2);
          if (dend < D(totalNeurons(i,1), totalNeurons(j,1))) && (totalNeurons(j,1) ~= totalNeurons(i,1)),
              D(totalNeurons(i,1), totalNeurons(j,1)) = dend;
              D(totalNeurons(j,1), totalNeurons(i,1)) = dend;
          end
       end
    end
    for i = 1:N,
        D(i,i) = 0;
    end
elseif xyz == 2, % Distances in xy-plane...
    for i = 1:length(totalNeurons) - 1,
       for j = i + 1:length(totalNeurons),
          dend = sqrt((totalNeurons(i,2)-totalNeurons(j,2))^2 + (totalNeurons(i,3)-totalNeurons(j,3))^2);
          if (dend < D(totalNeurons(i,1), totalNeurons(j,1))) && (totalNeurons(j,1) ~= totalNeurons(i,1)),
              D(totalNeurons(i,1), totalNeurons(j,1)) = dend;
              D(totalNeurons(j,1), totalNeurons(i,1)) = dend;
          end
       end
    end
    for i = 1:N,
        D(i,i) = 0;
    end
else % 3D distances...
    for i = 1:length(totalNeurons) - 1,
       for j = i + 1:length(totalNeurons),
          dend = sqrt((totalNeurons(i,2)-totalNeurons(j,2))^2 + (totalNeurons(i,3)-totalNeurons(j,3))^2 + (totalNeurons(i,4)-totalNeurons(j,4))^2);
          if (dend < D(totalNeurons(i,1), totalNeurons(j,1))) && (totalNeurons(j,1) ~= totalNeurons(i,1)),
              D(totalNeurons(i,1), totalNeurons(j,1)) = dend;
              D(totalNeurons(j,1), totalNeurons(i,1)) = dend;
          end
       end
    end
    for i = 1:N,
        D(i,i) = 0;
    end
end