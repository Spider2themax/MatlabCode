function [dataISI, dataSPIKE] = plotFigure3_v1(results3, results5, results6, results7, results9)

%{
    This program will plot the 'winner', aka the connectivity that leads to
    the lowest SPIKE-distances for a particular network size and geometry.

    Max Henderson
    Drexel University
    October 1, 2013
%}

%% Determine which gives minimal value for SPIKE and ISI.
dataISI = zeros(25, 5);
dataSPIKE = zeros(25, 5);

% 3 connections...
dataISI(:,1) = plotFigure3_v2([results3(:,1) results3(:,3) results3(:,5)]);
dataSPIKE(:,1) = plotFigure3_v2([results3(:,2) results3(:,4) results3(:,6)]);
    
% 5 connections...
dataISI(:,2) = plotFigure3_v2([results5(:,1) results5(:,3) results5(:,5)]);
dataSPIKE(:,2) = plotFigure3_v2([results5(:,2) results5(:,4) results5(:,6)]);

% 6 connections...
dataISI(:,3) = plotFigure3_v2([results6(:,1) results6(:,3) results6(:,5)]);
dataSPIKE(:,3) = plotFigure3_v2([results6(:,2) results6(:,4) results6(:,6)]);

% 7 connections...
dataISI(:,4) = plotFigure3_v2([results7(:,1) results7(:,3) results7(:,5)]);
dataSPIKE(:,4) = plotFigure3_v2([results7(:,2) results7(:,4) results7(:,6)]);

% 9 connections...
dataISI(:,5) = plotFigure3_v2([results9(:,1) results9(:,3) results9(:,5)]);
dataSPIKE(:,5) = plotFigure3_v2([results9(:,2) results9(:,4) results9(:,6)]);