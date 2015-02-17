function [] = getSimulationData(numNeurons, dir, spikeCount, strength, run, moveDir)

%{
    This function will allow users to visualize the neural firing patterns
    for a neural network.
%}

%% Read in the potentials across the neurons from the simulation.
if strength == '0',
    file_potentials = strcat(dir,'/spikes', spikeCount, 'strength0run', run, '.txt')
else
    file_potentials = strcat(dir,'/spikes', spikeCount, 'strength', strength, '.0run', run, '.txt')
end
    % --- file with neuron to reproduce
%file_potentials = strcat(dir,'/spikes', spikeCount, 'strength', strength, '.txt')

try
    t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
catch
    return
end
%{
Number of columns in the data matrix will be the number of neurons in the
simulation plus one, which will contain the time data.
%}
numNeurons
(length(t)+1)/numNeurons
data = reshape(t,numNeurons+1,size(t,1)/(numNeurons+1))';

%% Keep track of firings for each neuron.
s = zeros(numNeurons); % Spike trains
firings = zeros(numNeurons,1); % Mean firing rates
canFire = 1;
for i = 1:numNeurons,
    for j = 1:length(data),
        if data(j,i) > 0 && canFire == 1,
            firings(i) =  firings(i) + 1;
            s(firings(i), i) = data(j, numNeurons + 1);
            plot(j, i)
            canFire = 0;
        end
        if data(j,i) < 0,
            canFire = 1;
        end
    end
end
%% Write spike trains.
writeSpikeTrains(s, dir, spikeCount, strength, run);

%% Write average firing rate.
avgFiringRate = sum(firings/max(data(:,numNeurons+1)));
writeAvgFiringRate(avgFiringRate, dir, spikeCount, strength, run);

%% Write firings.
writeFirings(firings, dir, spikeCount, strength, run);

%% Calculate ISI.
%writeISI(s, dir, spikeCount, strength, run);

%% Calculate mean field potential.
writeMFP(data, dir, spikeCount, strength, run);

%% Move data to data2!
disp('Moving file...')
file_potentials
moveDir
movefile(file_potentials,moveDir)
