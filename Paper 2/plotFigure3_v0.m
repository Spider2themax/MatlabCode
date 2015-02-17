function [crys64isi, crys125isi, crys216isi, ran64isi, ran125isi, ran216isi] = plotFigure3_v0(results3, results5, results6, results7, results9)

%{
    This program will plot the 'winner', aka the connectivity that leads to
    the lowest SPIKE-distances for both simple cubic lattice and random 
    geometry.

    Max Henderson
    Drexel University
    October 1, 2013
%}

% Simple cubic lattice with 64 neurons...
[crys64isi, crys64spike] = plotFigure3_v1(results3(:,1:6), results5(:,1:6), results6(:,1:6), results7(:,1:6), results9(:,1:6));

% Simple cubic lattice with 125 neurons...
[crys125isi, crys125spike] = plotFigure3_v1(results3(:,7:12), results5(:,7:12), results6(:,7:12), results7(:,7:12), results9(:,7:12));

% Simple cubic lattice with 216 neurons...
[crys216isi, crys216spike] = plotFigure3_v1(results3(:,13:18), results5(:,13:18), results6(:,13:18), results7(:,13:18), results9(:,13:18));

% Random lattice with 64 neurons...
[ran64isi, ran64spike] = plotFigure3_v1(results3(:,19:24), results5(:,19:24), results6(:,19:24), results7(:,19:24), results9(:,19:24));

% Random lattice with 125 neurons...
[ran125isi, ran125spike] = plotFigure3_v1(results3(:,25:30), results5(:,25:30), results6(:,25:30), results7(:,25:30), results9(:,25:30));

% Random lattice with 216 neurons...
[ran216isi, ran216spike] = plotFigure3_v1(results3(:,31:36), results5(:,31:36), results6(:,31:36), results7(:,31:36), results9(:,31:36));

hold on
subplot(3,2,1)
plotFigure3_v3(crys64spike)


subplot(3,2,2)
plotFigure3_v3(crys125spike)

subplot(3,2,3)
plotFigure3_v3(crys216spike)

subplot(3,2,4)
plotFigure3_v3(ran64spike)

subplot(3,2,5)
plotFigure3_v3(ran125spike)

subplot(3,2,6)
plotFigure3_v3(ran216spike)