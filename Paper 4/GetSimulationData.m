function [spikes] = GetSimulationData(dir, N, fileIndex, stim, plotOrNot, age, simTime, con)

%{
    This function will import the spike firings of a neural network and
    optionally show the raster plot of the network.

    Max Henderson
    1/4/14
    Drexel University
%}


%% Read in the potentials across the neurons from the simulation.
if age == 1,
    file_potentials = strcat(dir,'/spikesYoung', int2str(con), '_1_',       int2str(fileIndex), '_', int2str(stim),'.txt');
elseif age == 2,
    file_potentials = strcat(dir,'/spikesOld',   int2str(con), '_1_age1_',  int2str(fileIndex), '_', int2str(stim),'.txt');    
elseif age == 3,
    file_potentials = strcat(dir,'/spikesOld',   int2str(con), '_1_age2_',  int2str(fileIndex), '_', int2str(stim),'.txt');  
elseif age == 4,
    file_potentials = strcat(dir,'/spikesYoung', int2str(con), '_2_',       int2str(fileIndex), '_', int2str(stim),'.txt');
elseif age == 5,
    file_potentials = strcat(dir,'/spikesOld',   int2str(con), '_2_age1_',  int2str(fileIndex), '_', int2str(stim),'.txt');    
else   
    file_potentials = strcat(dir,'/spikesOld',   int2str(con), '_2_age1_',  int2str(fileIndex), '_', int2str(stim),'.txt');    
end
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
    PlotSpikeTrains(spikes, N, simTime)
end

spikes = spikes';
spikes = spikes(:, 1:max(spikeCount)-1);