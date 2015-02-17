function [] = plotFigure7_v1(results, geometry, connectivity)


%% Geometry and connectivity mapping.
%Geometry -> 1 = Simple cubic lattice,  2 = Random lattice
if geometry == 1,
    marker = 's';
else
    marker = 'o';
end
%Connectivity -> 1 = NN, 2 = exp, 3 = random
if connectivity == 1,
    MarkerFaceColor = 'r';
elseif connectivity == 2,
    MarkerFaceColor = 'g';
else
    MarkerFaceColor = 'b';
end

%% Plot minimum SPIKE and gap junction it occurs.
[l w] = size(results);
numNeurons = 1;
conn = 3;
for i = 2:w,
    [C, I] = min(results(:,i));
    hold on
    subplot('Position',[0.1 (0.1 + (3-numNeurons)*0.25) 0.4 0.25])
    loglog(results(I, 1), C, 'Marker', marker, 'MarkerFaceColor', MarkerFaceColor, 'MarkerSize', conn*2)
    set(gca, 'FontName', 'Times', 'FontSize', 16)
    [conn, numNeurons] = plotFigure7_v2(conn, numNeurons);     
end