function [] = plotNetworkBehaviorFull_v1(numNeurons, currentDirectory)

cd(currentDirectory)
load spikeTrain1Strength0.txt
load spikeTrain1Strength1.txt
load spikeTrain1Strength2.txt
load spikeTrain1Strength3.txt
load spikeTrain1Strength4.txt
load spikeTrain1Strength5.txt
load spikeTrain1Strength6.txt
load spikeTrain1Strength7.txt
load spikeTrain1Strength8.txt
load spikeTrain1Strength9.txt
load spikeTrain1Strength10.txt
load MFP1Strength0.txt
load MFP1Strength1.txt
load MFP1Strength2.txt
load MFP1Strength3.txt
load MFP1Strength4.txt
load MFP1Strength5.txt
load MFP1Strength6.txt
load MFP1Strength7.txt
load MFP1Strength8.txt
load MFP1Strength9.txt
load MFP1Strength10.txt
cd '/home/hendemd/Desktop/MATLAB/bin/Neural research'
t = linspace(0,1000,length(MFP1Strength0));
simTime = max(t);
hold on
subplot(3,11,1)
plotSpikeTrains(spikeTrain1Strength0,numNeurons)
subplot(3,11,2)
plotSpikeTrains(spikeTrain1Strength1,numNeurons)
subplot(3,11,3)
plotSpikeTrains(spikeTrain1Strength2,numNeurons)
subplot(3,11,4)
plotSpikeTrains(spikeTrain1Strength3,numNeurons)
subplot(3,11,5)
plotSpikeTrains(spikeTrain1Strength4,numNeurons)
subplot(3,11,6)
plotSpikeTrains(spikeTrain1Strength5,numNeurons)
subplot(3,11,7)
plotSpikeTrains(spikeTrain1Strength6,numNeurons)
subplot(3,11,8)
plotSpikeTrains(spikeTrain1Strength7,numNeurons)
subplot(3,11,9)
plotSpikeTrains(spikeTrain1Strength8,numNeurons)
subplot(3,11,10)
plotSpikeTrains(spikeTrain1Strength9,numNeurons)
subplot(3,11,11)
plotSpikeTrains(spikeTrain1Strength10,numNeurons)
subplot(3,11,12)
powerSpectrumNeuralNetwork(spikeTrain1Strength0, simTime)
subplot(3,11,13)
powerSpectrumNeuralNetwork(spikeTrain1Strength1, simTime)
subplot(3,11,14)
powerSpectrumNeuralNetwork(spikeTrain1Strength2, simTime)
subplot(3,11,15)
powerSpectrumNeuralNetwork(spikeTrain1Strength3, simTime)
subplot(3,11,16)
powerSpectrumNeuralNetwork(spikeTrain1Strength4, simTime)
subplot(3,11,17)
powerSpectrumNeuralNetwork(spikeTrain1Strength5, simTime)
subplot(3,11,18)
powerSpectrumNeuralNetwork(spikeTrain1Strength6, simTime)
subplot(3,11,19)
powerSpectrumNeuralNetwork(spikeTrain1Strength7, simTime)
subplot(3,11,20)
powerSpectrumNeuralNetwork(spikeTrain1Strength8, simTime)
subplot(3,11,21)
powerSpectrumNeuralNetwork(spikeTrain1Strength9, simTime)
subplot(3,11,22)
powerSpectrumNeuralNetwork(spikeTrain1Strength10, simTime)
subplot(3,11,23)
maxMFP = max(MFP1Strength10);
plot(t, MFP1Strength0)
axis([0 100 -80 maxMFP])
subplot(3,11,24)
plot(t, MFP1Strength1)
axis([0 100 -80 maxMFP])
subplot(3,11,25)
plot(t, MFP1Strength2)
axis([0 100 -80 maxMFP])
subplot(3,11,26)
plot(t, MFP1Strength3)
axis([0 100 -80 maxMFP])
subplot(3,11,27)
plot(t, MFP1Strength4)
axis([0 100 -80 maxMFP])
subplot(3,11,28)
plot(t, MFP1Strength5)
axis([0 100 -80 maxMFP])
subplot(3,11,29)
plot(t, MFP1Strength6)
axis([0 100 -80 maxMFP])
subplot(3,11,30)
plot(t, MFP1Strength7)
axis([0 100 -80 maxMFP])
subplot(3,11,31)
plot(t, MFP1Strength8)
axis([0 100 -80 maxMFP])
subplot(3,11,32)
plot(t, MFP1Strength9)
axis([0 100 -80 maxMFP])
subplot(3,11,33)
plot(t, MFP1Strength10)
axis([0 100 -80 maxMFP])