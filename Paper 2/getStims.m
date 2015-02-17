function data = getStims(dir, spikeCount, strength)

%{
    This function will get the ISI information from various simulations.
%}

%% Read in the potentials across the neurons from the simulation.
file_potentials = strcat(dir,'/stims', spikeCount, 'strength', strength, '.0.txt') % --- file with neuron to reproduce
data = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));