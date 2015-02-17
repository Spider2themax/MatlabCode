function [] =  plotSingleMicroResults(currentDir, t, fileIndex, stim, con)


%% Get number of neurons in the network.
file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt');        
a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
N = a(1);

%% Plot the variously aged networks.
hold on
subplot(3,2,1)
title('Young')
GetSimulationData(currentDir, N, fileIndex, stim,  1, 1, t, con);
subplot(3,2,2)
title('Young')
GetSimulationData(currentDir, N, fileIndex, stim, 1, 4, t, con);

subplot(3,2,3)
title('Old, continuous')
GetSimulationData(currentDir, N, fileIndex, stim, 1, 2, t, con);
subplot(3,2,4)
title('Old, continuous')
GetSimulationData(currentDir, N, fileIndex, stim, 1, 5, t, con);

subplot(3,2,5)
title('Old discrete')
GetSimulationData(currentDir, N, fileIndex, stim, 1, 3, t, con);
subplot(3,2,6)
title('Old discrete')
GetSimulationData(currentDir, N, fileIndex, stim, 1, 6, t, con);