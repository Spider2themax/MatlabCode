function [] = testPairCorr()

file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/group figure data/spikeTrain2Strength100Run1.txt');
s100 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
plotPairCorrFunction(s100, 343, 500,  0.4, 0.1, 0.2, 0.2, 0, 0)