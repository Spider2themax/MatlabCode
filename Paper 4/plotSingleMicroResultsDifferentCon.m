function [] =  plotSingleMicroResultsDifferentCon(currentDir, t, fileIndex, stim, con)


%% Get number of neurons in the network.
file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt');        
a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
N = a(1);

%% Plot the variously aged networks.
hold on
subplot(3,1,1)
title('Distant-dependent')
GetSimulationData(currentDir, N, fileIndex, stim,  1, 1, t, 1);

subplot(3,1,2)
title('All-to-all micros')
GetSimulationData(currentDir, N, fileIndex, stim, 1, 1, t, 2);

subplot(3,1,3)
title('Common neighbor')
GetSimulationData(currentDir, N, fileIndex, stim, 1, 1, t, 3);
