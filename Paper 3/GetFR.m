function [FR] = GetFR(dir, N, fileIndex, con, age, stim, simTime)

%{
    This function will calculate the firing rate for a network.

    Max Henderson
    6/20/14
    Drexel University
%}


%% Read in the potentials across the neurons from the simulation.
file_potentials = strcat(dir,'spikes', int2str(con), '_', int2str(age), '_', int2str(fileIndex), '_', int2str(stim),'.txt')
t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));

FR = length(t)/(2*N*simTime/1000);