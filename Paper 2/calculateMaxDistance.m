function maxDistance = calculateMaxDistance(spikeTrain, numNeurons, simTime)

%% Reshape spike trains for all neurons in neural network.
l = length(spikeTrain)/numNeurons;
spikeTrain = reshape(spikeTrain,l,numNeurons);
firings = [ones(numNeurons,1) zeros(numNeurons,1)]; % First column = index, second = # of firings by time t.
maxDistance = 0;

%% Deal with the initialization issues of neural networks.
for t = 1:100,
    for i = 1:numNeurons,
        if t > spikeTrain(firings(i,1),i),
            firings(i,1) = firings(i,1) + 1;
        end
    end
end

%% Determine max distance.
for t = 101:simTime,
    for i = 1:numNeurons,
        if spikeTrain(firings(i,1),i) > t,
            firings(i,1) = firings(i,1) + 1;
            firings(i,2) = firings(i,2) + 1;
        end
    end
    for i = 1:numNeurons,
        for j = i+1:numNeurons,
           maxDistance = maxDistance + abs(firings(i,2) - firings(j,2));
        end
    end
end
maxDistance = maxDistance/(sum(firings(:,1)));