function [] = plotDistHist(data, n1, n2, n3, n4, ylabelyes, xticlabelyes, x1, x2, x3, x4)

%{
    This function will visualize distance distributions of simple cubic
    lattice and random networks.
%}
subplot('position', [n1 n2 n3 n4])
set(gca,  'XTick', [], 'YTick', [])
box on

% dummy axes for the box and background color
ax0 = axes('Position', [n1, n2, n3, n4]);
set (ax0, 'Box', 'on', 'Color', 'white', 'XTick', [], 'YTick', []);

% first axes for left y-axis
ax1 = axes ('Position', get (ax0, 'Position'));
set (ax1, 'Box', 'off', 'Color', 'none', 'YAxisLocation', 'left', 'LineWidth',2,'FontSize',20, 'FontName', 'Times', 'FontWeight', 'bold')

if ylabelyes == 1,
    ylabel('', 'FontSize', 20, 'FontName','Times', 'FontWeight', 'bold')
end
if xticlabelyes ~= 1,
    set(gca,'XTickLabel',[])
else
    xlabel('Neuronal distance (micrometers)', 'FontSize', 20, 'FontName','Times', 'FontWeight', 'bold')
end

% second axes for right y-axis assuming common x-axis controlled by ax1
%ax2 = axis([x1 x2 x3 x4]);
%set (ax2, 'Box', 'off', 'Color', 'none', 'XTick', [], 'YAxisLocation', 'right', 'Ytick', []);

hist(data, 250)
