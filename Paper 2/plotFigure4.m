function [] = plotFigure4(d_para, f_para)

%% Load data and calculate ISI and SPIKE distances.
file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/Paper 2 Figure 2/RE6conG100.txt')
spike1 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
results1 = f_distances_MEX(spike1,d_para,f_para, 343);

file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/Paper 2 Figure 2/RE3conG20.txt')
spike2 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
results2 = f_distances_MEX(spike2,d_para,f_para, 343);

%% Plot data in black and white.
size1 = length(results1.dissimilarity_profiles{1});
size2 = length(results2.dissimilarity_profiles{1});
hold on
subplot(2,2,1)
plotSpikeTrains(spike1, 343, min([size1 size2]))
subplot(2,2,2)
plot(linspace(1,size1,size1), results1.dissimilarity_profiles{1}, 'k', linspace(1,size1,size1), results1.dissimilarity_profiles{2}, 'k')
axis([0, min([size1 size2]),0,0.4])
legend('I^a','S^a')
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold')
subplot(2,2,3)
plotSpikeTrains(spike2, 343, min([size1 size2]))
subplot(2,2,4)
plot(linspace(1,size2,size2), results2.dissimilarity_profiles{1}, 'k', linspace(1,size2,size2), results2.dissimilarity_profiles{2}, 'k')
axis([0, min([size3 size6]),0,0.4])
legend('I^a','S^a')
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold')