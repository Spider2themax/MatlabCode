function [distances] = plotFigure2_v1(maxDim)

%{
    This program will show the average growth of dendritic trees using 
    either random, exponential, or nearest neighbor connectivity schemes
    in our basic model for neural growth.  As network sizes get larger and
    the number of connections grows, the dendritic trees will also get
    larger.

    Max Henderson
    Drexel University
    September 30, 2013
%}

con = [3; 5; 7];
hold on
for i = 1:length(con),
    if i == 1,
        distances = plotFigure2_v0(maxDim, con(i));
        a = distances;
    else
        a = plotFigure2_v0(maxDim, con(i));
        distances = [distances; a];
    end
    plotFigure2_v2(a)
end