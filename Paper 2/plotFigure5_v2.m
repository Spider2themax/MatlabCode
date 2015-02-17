function [] = plotFigure5_v2(con0, con10, con17, con40, con100, results0, results10, results17, results40, results100)

size0 = length(results0.dissimilarity_profiles{1});
size10 = length(results10.dissimilarity_profiles{1});
size17 = length(results17.dissimilarity_profiles{1});
size40 = length(results40.dissimilarity_profiles{1});
size100 = length(results100.dissimilarity_profiles{1});

hold on
subplot('position', [0.1 0.74 0.35 0.16])
plotSpikeTrains(con0, 216, min([size0 size10 size17 size40 size100]))
set(gca,'LineWidth',1,'FontSize',16, 'FontWeight', 'bold', 'FontName','Times', 'YTick', [linspace(0,250,11)])
[AX,H1,H2] = plotyy(t, y1, t, y2);
% change the number of tick marks on each Y axis to see the issue
Nticks = 8;
y1 = linspace(0, 8e4, Nticks);
y2 = linspace(0, 14, 0); %put 4 more ticks on the right Y axis
% set the new limits and tick marks. Notice how there appear to be two sets
% of tick marks on the right axis.
set(AX(1), 'ylim', [y1(1), y1(end)], 'ytick', y1);
set(AX(2), 'ylim', [y2(1), y2(end)], 'ytick', y2); 