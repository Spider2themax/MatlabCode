function data = getISI(numNeurons, dir, spikeCount)

%{
    This function will get the ISI information from various simulations.
%}

%% Read in the potentials across the neurons from the simulation.
file_potentials = strcat(dir,'/ISI', spikeCount, '.txt') % --- file with neuron to reproduce
data = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));