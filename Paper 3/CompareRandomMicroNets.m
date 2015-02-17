function [] = CompareRandomMicroNets()

hold on
subplot(2,2,1)
PlotSpikeTrainFromFileName('/data2/L/Brain/max/Paper2.5Data/testStrengths/spikes1_1_1_31_7.0.txt', 616)
subplot(2,2,2)
PlotSpikeTrainFromFileName('/data2/L/Brain/max/Paper2.5Data/testStrengths/spikes2_1_1_31_7.0.txt', 616)
subplot(2,2,3)
PlotSpikeTrainFromFileName('/data2/L/Brain/max/Paper2.5Data/testStrengths/spikes1_3_1_31_7.0.txt', 616)
subplot(2,2,4)
PlotSpikeTrainFromFileName('/data2/L/Brain/max/Paper2.5Data/testStrengths/spikes2_3_1_31_7.0.txt', 616)