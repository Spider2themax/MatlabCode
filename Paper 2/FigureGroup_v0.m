function [] = FigureGroup_v0()

N =  343;
file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/group figure data/spikeTrain2Strength0Run1.txt');
s0 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/group figure data/spikeTrain2Strength8Run1.txt');
s8 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/group figure data/spikeTrain2Strength100Run1.txt');
s100 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
hold on

subplot(3,2,1)
plotSpikeTrains_v1(s0, N, 500)

subplot(3,2,2)
GroupGofT_v0(s0, N);

subplot(3,2,3)
plotSpikeTrains_v1(s8, N, 500)

subplot(3,2,4)
GroupGofT_v0(s8, N);

subplot(3,2,5)
plotSpikeTrains_v1(s100, N, 500)

subplot(3,2,6)
GroupGofT_v0(s100, N);
