function spikes = GetSPIKESrandom(spikes, numNeuronsToKeep)

randomIndices = ceil(numNeuronsToKeep*rand(numNeuronsToKeep, 1));
spikes = spikes(randomIndices, :);