function [] = plotFigure2_v2(distances)

%{

    Max Henderson
    Drexel University
    September 30, 2013
%}


x = [4;5;6;7;8;9;10];
plot(x, distances(:,1),  's', x, distances(:,2),  's',x, distances(:,3),  's',x, distances(:,4),  's',x, distances(:,5), 's', x, distances(:,6), 's')
