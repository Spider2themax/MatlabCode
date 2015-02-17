function data = getFR(dir, spikeCount, strength)

%{
    This function will get the FR information from various simulations.
%}

%% Read in the potentials across the neurons from the simulation.
file_potentials = strcat(dir,'/avgFiringRate', spikeCount, 'Strength', strength, '.txt'); % --- file with neuron to reproduce
data = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));