function [] = plotFigureFinal1_v1(SPIKE, distOrAlg, g, geocon, N, CON)

%{
    This function will be used to plot points on a 3D graph based on either
    algebriac connectivity or total dendritic length and the effects of 
    gap junctions and SPIKE-distances.

    Key for geocon:

    1 = CN
    2 = CE
    3 = CR
    4 = RN
    5 = RE
    6 = RR

    Max Henderson
    Drexel University
    Oct 22, 2013
%}

%% Assign marker color based on geometry and connectivity scheme.
if geocon == 1,
    MarkerFaceColor = 'm';
elseif geocon == 2,
    MarkerFaceColor = 'b';
elseif geocon == 3,
    MarkerFaceColor = 'c';
elseif geocon == 4,
    MarkerFaceColor = 'g';
elseif geocon == 5,
    MarkerFaceColor = 'y';
else
    MarkerFaceColor = 'r';
end

%% Shape of marker based on number of neurons in network.
if N == 64,
    marker = 's';
elseif N == 125,
    marker = 'o';
elseif N == 216,
    marker = 'd';
else
    marker = '^';
end

%% Size of marker will be based on the number of connections per neuron.
hold on
if distOrAlg > 20,
    subplot(1,3,2)
    loglog(distOrAlg, SPIKE, 'Marker', marker, 'MarkerFaceColor', MarkerFaceColor, 'MarkerSize', 2*CON)
else
    subplot(1,3,3)
    loglog(distOrAlg, SPIKE, 'Marker', marker, 'MarkerFaceColor', MarkerFaceColor, 'MarkerSize', 2*CON)
end