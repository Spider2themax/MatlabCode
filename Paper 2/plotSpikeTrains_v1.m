function [] = plotSpikeTrains_v1(spikeTrain, numNeurons, simTime)

%{
    This function will visualize spike trains of neural networks.
%}

l = length(spikeTrain)/numNeurons;
spikeTrain = reshape(spikeTrain,l,numNeurons);
spikeTrain = spikeTrain';
axis([0 simTime 1 numNeurons+1])
for i = 1:numNeurons,
    for j = 1:l,
        if spikeTrain(i,j) > 0,
            hold on
            line([spikeTrain(i,j); spikeTrain(i,j)], [i-0.5,i+0.5], 'LineWidth',2)
        end
    end
end