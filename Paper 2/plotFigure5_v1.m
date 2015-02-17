function [] = plotFigure5_v1(con0, con10, con17, con40, con100, results0, results10, results17, results40, results100)

size0 = length(results0.dissimilarity_profiles{1});
size10 = length(results10.dissimilarity_profiles{1});
size17 = length(results17.dissimilarity_profiles{1});
size40 = length(results40.dissimilarity_profiles{1});
size100 = length(results100.dissimilarity_profiles{1});
hold on
subplot(5,1,1)
plotSpikeTrains(con0, 216, min([size0 size10 size17 size40 size100]))
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
ylabel('Neural ID', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName','Times')
subplot(5,1,2)
plotSpikeTrains(con10, 216, min([size0 size10 size17 size40 size100]))
ylabel('Neural ID', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName','Times')
subplot(5,1,3)
plotSpikeTrains(con17, 216, min([size0 size10 size17 size40 size100]))
ylabel('Neural ID', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName','Times')
subplot(5,1,4)
plotSpikeTrains(con40, 216, min([size0 size10 size17 size40 size100]))
ylabel('Neural ID', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName','Times')
subplot(5,1,5)
plotSpikeTrains(con100, 216, min([size0 size10 size17 size40 size100]))
ylabel('Neural ID', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
xlabel('Time (ms)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName','Times')