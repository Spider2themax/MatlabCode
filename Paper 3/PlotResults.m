function [] =  PlotResults(currentDir, t, fileIndex, stim)


%% Get number of neurons in the network.
file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt')        
a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
N = a(1);

%% Plot the variously aged networks.
hold on
subplot(2,2,1)
GetSimulationData(currentDir, N, fileIndex, 1, 1, stim, t, 1);

xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName', 'Times')
title('Young - BCN')

subplot(2,2,2)
GetSimulationData(currentDir, N, fileIndex, 2, 1, stim, t, 1);
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName', 'Times')
title('Young - ACN')

%subplot(3,2,3)
%title('Old')
%GetSimulationData(currentDir, N, fileIndex, 1, 2, stim, t, 1);
%subplot(3,2,4)
%title('Old')
%GetSimulationData(currentDir, N, fileIndex, 2, 2, stim, t, 1);

subplot(2,2,3)
GetSimulationData(currentDir, N, fileIndex, 1, 3, stim, t, 1);
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName', 'Times')
title('Random - BCN')

subplot(2,2,4)
GetSimulationData(currentDir, N, fileIndex, 2, 3, stim, t, 1);
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName', 'Times')
title('Random - ACN')