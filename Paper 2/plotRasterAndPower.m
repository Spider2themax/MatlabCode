function [] = plotRasterAndPower(spikes, numNeurons, simTime)

hold on
subplot(2,1,1)
plotSpikeTrains(spikes, numNeurons);
subplot(2,1,2)
[power, freq] = powerSpectrumNeuralNetwork(spikes, simTime);
plot(freq, power)

