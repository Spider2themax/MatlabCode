function d = plotISIdistances(currentDir, numNeurons, simTime)

cd(currentDir)
load spikeTrain1Strength0Run1.txt
load spikeTrain1Strength1Run1.txt
load spikeTrain1Strength2Run1.txt
load spikeTrain1Strength3Run1.txt
load spikeTrain1Strength4Run1.txt
load spikeTrain1Strength5Run1.txt
load spikeTrain1Strength6Run1.txt
load spikeTrain1Strength7Run1.txt
load spikeTrain1Strength8Run1.txt
load spikeTrain1Strength9Run1.txt
load spikeTrain1Strength10Run1.txt
load spikeTrain1Strength11Run1.txt
load spikeTrain1Strength12Run1.txt
load spikeTrain1Strength12Run1.txt
load spikeTrain1Strength13Run1.txt
load spikeTrain1Strength14Run1.txt
load spikeTrain1Strength15Run1.txt
load spikeTrain1Strength16Run1.txt
load spikeTrain1Strength17Run1.txt
load spikeTrain1Strength18Run1.txt
load spikeTrain1Strength19Run1.txt
load spikeTrain1Strength20Run1.txt
cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
d = zeros(21,1);
d(1) = averagedBivariateISIdist(spikeTrain1Strength0Run1, numNeurons, simTime);
d(2) = averagedBivariateISIdist(spikeTrain1Strength1Run1, numNeurons, simTime);
d(3) = averagedBivariateISIdist(spikeTrain1Strength2Run1, numNeurons, simTime);
d(4) = averagedBivariateISIdist(spikeTrain1Strength3Run1, numNeurons, simTime);
d(5) = averagedBivariateISIdist(spikeTrain1Strength4Run1, numNeurons, simTime);
d(6) = averagedBivariateISIdist(spikeTrain1Strength5Run1, numNeurons, simTime);
d(7) = averagedBivariateISIdist(spikeTrain1Strength6Run1, numNeurons, simTime);
d(8) = averagedBivariateISIdist(spikeTrain1Strength7Run1, numNeurons, simTime);
d(9) = averagedBivariateISIdist(spikeTrain1Strength8Run1, numNeurons, simTime);
d(10) = averagedBivariateISIdist(spikeTrain1Strength9Run1, numNeurons, simTime);
d(11) = averagedBivariateISIdist(spikeTrain1Strength10Run1, numNeurons, simTime);
d(12) = averagedBivariateISIdist(spikeTrain1Strength11Run1, numNeurons, simTime);
d(13) = averagedBivariateISIdist(spikeTrain1Strength12Run1, numNeurons, simTime);
d(14) = averagedBivariateISIdist(spikeTrain1Strength13Run1, numNeurons, simTime);
d(15) = averagedBivariateISIdist(spikeTrain1Strength14Run1, numNeurons, simTime);
d(16) = averagedBivariateISIdist(spikeTrain1Strength15Run1, numNeurons, simTime);
d(17) = averagedBivariateISIdist(spikeTrain1Strength16Run1, numNeurons, simTime);
d(18) = averagedBivariateISIdist(spikeTrain1Strength17Run1, numNeurons, simTime);
d(19) = averagedBivariateISIdist(spikeTrain1Strength18Run1, numNeurons, simTime);
d(20) = averagedBivariateISIdist(spikeTrain1Strength19Run1, numNeurons, simTime);
d(21) = averagedBivariateISIdist(spikeTrain1Strength20Run1, numNeurons, simTime);

w = linspace(0,0.1,21);
plot(w, d)