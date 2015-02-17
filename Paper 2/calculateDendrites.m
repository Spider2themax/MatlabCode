function Dend = calculateDendrites(numNeurons, pos)

%% Make copies of network to surround network for periodic BC.
a = (numNeurons*(484^3)/7000)^(1/3);
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
%plot3(totalNeurons(:,2),totalNeurons(:,3),totalNeurons(:,4),'s')

%% Find the closest neural distance between each pair of neurons.
Dend = zeros(numNeurons) + 100000;
%{
for i = 1:numNeurons,
   for j = i:length(totalNeurons),
      dend = sqrt((totalNeurons(i,2)-totalNeurons(j,2))^2 + (totalNeurons(i,3)-totalNeurons(j,3))^2 + (totalNeurons(i,4)-totalNeurons(j,4))^2);
      if (dend < Dend(i, totalNeurons(j,1))) && (totalNeurons(j,1) ~= totalNeurons(i,1)),
          Dend(i, totalNeurons(j,1)) = dend;
          Dend(totalNeurons(j,1), i) = dend;
      end
   end
end
%}

for i = 1:length(totalNeurons) - 1,
   for j = i + 1:length(totalNeurons),
      dend = sqrt((totalNeurons(i,2)-totalNeurons(j,2))^2 + (totalNeurons(i,3)-totalNeurons(j,3))^2 + (totalNeurons(i,4)-totalNeurons(j,4))^2);
      if (dend < Dend(totalNeurons(i,1), totalNeurons(j,1))) && (totalNeurons(j,1) ~= totalNeurons(i,1)),
          Dend(totalNeurons(i,1), totalNeurons(j,1)) = dend;
          Dend(totalNeurons(j,1), totalNeurons(i,1)) = dend;
      end
   end
end
