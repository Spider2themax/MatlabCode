function [] = plotIndSPIKEDist_v1(spikeRan, spikeGroup, spikeSynch, N, d_para, f_para)

resultsRan=f_distances_MEX(spikeRan,d_para,f_para, 64);
resultsGroup=f_distances_MEX(spikeGroup,d_para,f_para, 64);
resultsSynch=f_distances_MEX(spikeSynch,d_para,f_para, 64);

hold on
subplot(3,2,2)
plotIndSPIKEDist(resultsRan.distance_matrices, N);
axis([0 0.4 0 80])
subplot(3,2,1)
plotSpikeTrains_v1(spikeRan, 64, 500)

subplot(3,2,4)
plotIndSPIKEDist(resultsGroup.distance_matrices, N);
axis([0 0.4 0 80])
subplot(3,2,3)
plotSpikeTrains_v1(spikeGroup, 64, 500)

subplot(3,2,6)
plotIndSPIKEDist(resultsSynch.distance_matrices, N);
axis([0 0.4 0 80])
subplot(3,2,5)
plotSpikeTrains_v1(spikeSynch, 64, 500)