function [] = plotISIandSPIKE(sizePlot, resultsPlot, simTime, n1, n2, n3, n4, ylabelyes, xticlabelyes, legendyes)

%{
    This function will visualize spike trains of neural networks.
%}
subplot('position', [n1 n2 n3 n4])
set(gca,  'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', [])
box on

% dummy axes for the box and background color
ax0 = axes('Position', [n1, n2, n3, n4]);
set (ax0, 'Box', 'on', 'Color', 'white', 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', []);

% first axes for left y-axis
ax1 = axes ('Position', get (ax0, 'Position'));
set (ax1, 'Box', 'off', 'Color', 'none', 'YAxisLocation', 'left', 'LineWidth',2,'FontSize',20, 'FontName', 'Arial', 'FontWeight', 'bold');

if ylabelyes == 1,
    ylabel('Neural ID', 'FontSize', 20, 'FontName','Arial', 'FontWeight', 'bold')
end
if xticlabelyes ~= 1,
    set(gca,'XTickLabel',[])
else
    xlabel('Time (ms)', 'FontSize', 20, 'FontName','Arial', 'FontWeight', 'bold')
end

% second axes for right y-axis assuming common x-axis controlled by ax1
%ax2 = axes ('Position', get (ax0, 'Position'));
%set (ax2, 'Box', 'off', 'Color', 'none', 'XTick', [], 'YAxisLocation', 'right', 'Ytick', []);
hold on
plot(linspace(1,sizePlot,sizePlot), resultsPlot.dissimilarity_profiles{1}, 'k', 'LineWidth',2)
plot(linspace(1,sizePlot,sizePlot), resultsPlot.dissimilarity_profiles{2}, 'k', 'LineWidth',2, 'LineStyle','--')
plot(linspace(1,sizePlot,sizePlot), resultsPlot.overall_dissimilarities(1)*ones(sizePlot), 'k', 'LineWidth',2)
plot(linspace(1,sizePlot,sizePlot), resultsPlot.overall_dissimilarities(2)*ones(sizePlot), 'k', 'LineWidth',2, 'LineStyle','--')
%axisMin = min([resultsPlot.dissimilarity_profiles{1} resultsPlot.dissimilarity_profiles{2}]);
%axisMax = max([resultsPlot.dissimilarity_profiles{1} resultsPlot.dissimilarity_profiles{2}]);
axis([0 simTime 0 0.35])
if legendyes == 1,
    hleg1 = legend('ISI','SPIKE');
    set(hleg1,'Location','SouthEast', 'Color', 'none', 'FontSize', 16, 'FontName','Arial', 'FontWeight', 'bold');
end
