function [] = plotFigure5(con0, con10, con17, con40, con100, results0, results10, results17, results40, results100)

size0 = length(results0.dissimilarity_profiles{1});
size10 = length(results10.dissimilarity_profiles{1});
size17 = length(results17.dissimilarity_profiles{1});
size40 = length(results40.dissimilarity_profiles{1});
size100 = length(results100.dissimilarity_profiles{1});
simTime = min([size0 size10 size17 size40 size100]);

hold on
plotSpikeTrains(con0, 216, min([size0 size10 size17 size40 size100]), 0.1, 0.74, 0.35, 0.16, 0, 0)
plotISIandSPIKE(size0, results0, simTime,0.5, 0.74, 0.35, 0.16, 0, 0, 1)
plotSpikeTrains(con10, 216, min([size0 size10 size17 size40 size100]), 0.1, 0.58, 0.35, 0.16, 0, 0)
plotISIandSPIKE(size10, results10, simTime, 0.5, 0.58, 0.35, 0.16, 0, 0, 0)
plotSpikeTrains(con17, 216, min([size0 size10 size17 size40 size100]), 0.1, 0.42, 0.35, 0.16, 1, 0)
plotISIandSPIKE(size17, results17, simTime, 0.5, 0.42, 0.35, 0.16, 0, 0, 0)
plotSpikeTrains(con40, 216, min([size0 size10 size17 size40 size100]),0.1, 0.26, 0.35, 0.16, 0, 0)
plotISIandSPIKE(size40, results40, simTime, 0.5, 0.26, 0.35, 0.16, 0, 0, 0)
plotSpikeTrains(con100, 216, min([size0 size10 size17 size40 size100]), 0.1, 0.1, 0.35, 0.16, 0, 1)
plotISIandSPIKE(size100, results100, simTime, 0.5, 0.1, 0.35, 0.16, 0, 1, 0)

ax = axes('position',[0,0,1,1],'visible','off');
text(0.11, 0.12, '(I)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.51, 0.12, '(J)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.11, 0.28, '(G)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.51, 0.28, '(H)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.11, 0.44, '(E)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.51, 0.44, '(F)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.11, 0.6, '(C)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.51, 0.6, '(D)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.11, 0.76, '(A)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
text(0.51, 0.76, '(B)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
