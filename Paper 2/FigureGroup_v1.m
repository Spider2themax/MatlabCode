function [] = FigureGroup_v1()

file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/group figure data/spikeTrain2Strength0Run1.txt');
s0 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/group figure data/spikeTrain2Strength8Run1.txt');
s8 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/group figure data/spikeTrain2Strength100Run1.txt');
s100 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));

hold on
plotSpikeTrains     (s0,   343, 500,  0.1, 0.5, 0.2, 0.2, 0, 0)
plotPairCorrFunction(s0,   343, 500,  0.35, 0.5, 0.2, 0.2, 0, 0)
plotSpikeTrains     (s8,   343, 500,  0.1, 0.3, 0.2, 0.2, 1, 0)
plotPairCorrFunction(s8,   343, 500,  0.35, 0.3, 0.2, 0.2, 1, 0)
plotSpikeTrains     (s100, 343, 500,  0.1, 0.1, 0.2, 0.2, 0, 1)
plotPairCorrFunction(s100, 343, 500,  0.35, 0.1, 0.2, 0.2, 0, 1)