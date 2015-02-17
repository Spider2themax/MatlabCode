function [] = moveStimulationData(dir, spikeCount, strength, run, moveDir)

%{
    This function will move stimulation data.
%}

%% Read in the potentials across the neurons from the simulation.
file_potentials = strcat(dir,'/stims', spikeCount, 'strength', strength, 'run', run, '.txt'); % --- file with neuron to reproduce
%file_potentials = strcat(dir,'/spikes', spikeCount, 'strength', strength, '.txt')
file_potentials = strcat(file_potentials)
try
    t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
catch
    return
end

%% Move data to data2!
disp('Moving file...')
file_potentials
moveDir
movefile(file_potentials,moveDir)
