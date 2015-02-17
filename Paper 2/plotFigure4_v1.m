function [] = plotFigure4_v1(d_para, f_para)


%% Load data and calculate ISI and SPIKE distances.
file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/Paper 2 Figure 2/RE3conG20.txt')
spike1 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
results1 = f_distances_MEX(spike1,d_para,f_para, 343)

file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Paper 2/Paper 2 Figure 2/RE6conG100.txt')
spike2 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
results2 = f_distances_MEX(spike2,d_para,f_para, 343)

size0 = length(results1.dissimilarity_profiles{1});
size10 = length(results2.dissimilarity_profiles{1});
simTime = min([size0 size10]);

hold on
plotSpikeTrains(spike1, 343, min([size0 size10 ]),  0.1, 0.5, 0.35, 0.4, 1, 0)
plotISIandSPIKE(size0, results1, simTime,         0.5, 0.5, 0.35, 0.4, 0, 0, 1)
plotSpikeTrains(spike2, 343, min([size0 size10 ]), 0.1, 0.1, 0.35, 0.4, 1, 1)
plotISIandSPIKE(size10, results2, simTime,       0.5, 0.1, 0.35, 0.4, 0, 1, 0)

ax = axes('position',[0,0,1,1],'visible','off');
text(0.11, 0.52, '(a)','FontSize', 30, 'FontWeight', 'bold', 'FontName','Arial') 
text(0.51, 0.52, '(b)','FontSize', 30, 'FontWeight', 'bold', 'FontName','Arial') 
text(0.11, 0.12, '(c)','FontSize', 30, 'FontWeight', 'bold', 'FontName','Arial') 
text(0.51, 0.12, '(d)','FontSize', 30, 'FontWeight', 'bold', 'FontName','Arial') 