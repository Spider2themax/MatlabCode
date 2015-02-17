function D = averagedBivariateISIdist(spikeTrain, numNeurons, simTime)

%% Reshape spike trains for all neurons in neural network.
l = length(spikeTrain)/numNeurons;
spikeTrain = reshape(spikeTrain,l,numNeurons);

%% Calculate instantaneous average A(t) over all pairwise absolute ISI-ratios.
A = zeros(simTime, 1);
% First, calculate X-ISI for each neuron.
XISI = getXISI(spikeTrain, simTime, numNeurons);
for t = 1:simTime,
   for i = 1:numNeurons,
       for j = i+1:numNeurons,
           % Next, calculate ISI-ratio between these values.
           if XISI(t,i) == 0,
               XISI(t,i) = 1;
           end
           if XISI(t,j) == 0,
               XISI(t,j) = 1;
           end
           if XISI(t,i) < XISI(t,j),
               I = (XISI(t,i)/XISI(t,j))-1;
           else
               I = -((XISI(t,j)/XISI(t,i))-1);
           end
           % Finish by adding this value to the current A(t).
           A(t) = A(t) + abs(I);
       end
   end
   % Normalize A(t).
   A(t) = A(t)/(numNeurons*(numNeurons-1)/2);
end

%% Finally, calculate averaged bivariate ISI-distance using A.
D = sum(A)/simTime;
