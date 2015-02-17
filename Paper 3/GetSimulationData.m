function [spikes] = GetSimulationData(dir, N, fileIndex, con, age, stim, simTime, plotOrNot)

%{
    This function will import the spike firings of a neural network and
    optionally show the raster plot of the network.

    Max Henderson
    1/4/14
    Drexel University
%}


%% Read in the potentials across the neurons from the simulation.
file_potentials = strcat(dir,'spikes', int2str(con), '_', int2str(age), '_', int2str(fileIndex), '_', int2str(stim),'.txt')
t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));

%% Put into matrix form.
spikes = zeros(N);
spikeCount = ones(N,1);
for i = 1:length(t)/2,
    spikes(spikeCount(t(i*2-1)), t(i*2-1)) = t(i*2);
    spikeCount(t(i*2-1)) = spikeCount(t(i*2-1)) + 1;
end

%% Show raster plot.
if plotOrNot == 1,
    PlotSpikeTrains(spikes, N, simTime);
end
spikes = spikes';
spikes = spikes(:, 1:max(spikeCount)-1);