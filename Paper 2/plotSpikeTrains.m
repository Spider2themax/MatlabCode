function [] = plotSpikeTrains(spikeTrain, numNeurons, simTime, n1, n2, n3, n4, ylabelyes, xticlabelyes)

%{
    This function will visualize spike trains of neural networks.
%}
subplot('position', [n1 n2 n3 n4])
set(gca,  'XTick', [], 'YTick', [])
box on
l = length(spikeTrain)/numNeurons;
spikeTrain = reshape(spikeTrain,l,numNeurons);
spikeTrain = spikeTrain';

% dummy axes for the box and background color
ax0 = axes('Position', [n1, n2, n3, n4]);
set (ax0, 'Box', 'on', 'Color', 'white', 'XTick', [], 'YTick', []);

% first axes for left y-axis
ax1 = axes ('Position', get (ax0, 'Position'));
set (ax1, 'Box', 'off', 'Color', 'none', 'YAxisLocation', 'left', 'LineWidth',2,'FontSize',20, 'FontName', 'Arial', 'FontWeight', 'bold')
axis([0 simTime 1 numNeurons+1])
if ylabelyes == 1,
    ylabel('Neural ID', 'FontSize', 20, 'FontName','Arial', 'FontWeight', 'bold')
end
if xticlabelyes ~= 1,
    set(gca,'XTickLabel',[])
else
    xlabel('Time (ms)', 'FontSize', 20, 'FontName','Arial', 'FontWeight', 'bold')
end

% second axes for right y-axis assuming common x-axis controlled by ax1
ax2 = axes ('Position', get (ax0, 'Position'));
set (ax2, 'Box', 'off', 'Color', 'none', 'XTick', [], 'YAxisLocation', 'right', 'Ytick', []);
axis([0 simTime 1 numNeurons+1])

for i = 1:numNeurons,
    for j = 1:l,
        if spikeTrain(i,j) > 0,
            hold on
            line([spikeTrain(i,j); spikeTrain(i,j)], [i-0.5,i+0.5], 'LineWidth',3, 'Color', 'k')
        end
    end
end