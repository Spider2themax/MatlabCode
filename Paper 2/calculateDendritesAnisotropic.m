function [Dend, DendAng] = calculateDendritesAnisotropic(numNeurons, pos, Z)

%{
    This program will calculate absolute distances between all neural pairs
    as well as the angle between the two, with respects to the xy-plane.
    The justification for incorporating angles into dendritic calculations
    is due to the fact that axons and dendrites have a perference in terms
    of spanning the layers of the brain, with axons typically going into 
    deeper layers of the brain while dendrites tend to span into shallower
    layers of the brain.

    Our model will have a simplified anisotropic consideration: we will
    consider that if a neuron has an angular dependence in terms of
    connectivity. Neurons will only be allowed to grow dendrites 'up', aka
    can only make dendritic connections to neurons with larger z-values. On
    top of this consideration, the angle will also contribute to connection
    probability.

    Max Henderson
    Drexel University
    June 23, 2013
%}

%% Make copies of network to surround network for periodic BC.
%a = (numNeurons*(484^3)/7000)^(1/3);
a = max(max(pos));
totalNeurons = zeros(27*numNeurons,4);
count = 1;
for i = 0:2,
    for j = 0:2,
        for k = 0:2,
            totalNeurons(count:count+numNeurons-1,1) = linspace(1,numNeurons,numNeurons);
            totalNeurons(count:count+numNeurons-1,2) = pos(1:numNeurons,1)+i*a;
            totalNeurons(count:count+numNeurons-1,3) = pos(1:numNeurons,2)+j*a;
            totalNeurons(count:count+numNeurons-1,4) = pos(1:numNeurons,3)+k*a;
            count = count + numNeurons;
        end
    end
end
%plot3(totalNeurons(:,2), totalNeurons(:,3), totalNeurons(:,4),'s')
%% Find the closest neural distance between each pair of neurons.
Dend = zeros(numNeurons) + 100000;
DendAng = Dend;
AngProb = zeros(numNeurons);
for i = 1:length(totalNeurons),
   for j = 1:length(totalNeurons),
       if totalNeurons(i,1) ~= totalNeurons(j,1),
          dend = sqrt((totalNeurons(i,2)-totalNeurons(j,2))^2 + (totalNeurons(i,3)-totalNeurons(j,3))^2 + (totalNeurons(i,4)-totalNeurons(j,4))^2);
          % Get anisotropic distance...
          if ((totalNeurons(j,4) + Z > totalNeurons(i,4)) && dend < DendAng(totalNeurons(i,1), totalNeurons(j,1))),
              DendAng(totalNeurons(i,1), totalNeurons(j,1)) = dend;
          end
          if ((totalNeurons(i,4) + Z > totalNeurons(j,4)) && dend < DendAng(totalNeurons(j,1), totalNeurons(i,1))),
              DendAng(totalNeurons(j,1), totalNeurons(i,1)) = dend;
          end
          % Get isotropic distance...
          if (dend < Dend(totalNeurons(i,1), totalNeurons(j,1))),
              Dend(totalNeurons(i,1), totalNeurons(j,1)) = dend;
              Dend(totalNeurons(j,1), totalNeurons(i,1)) = dend;
          end
       end
   end
end