function [] = VisualizeNetworkGrid(geo)

%{

    This program will be used to visualize how the neural points collapse
    onto different 2D grids.

    Max Henderson
    Drexel University

%}
hold on

subplot(3,2,2)
plot(geo(:,1), geo(:,2),'s')
subplot(3,2,4)
plot(geo(:,1), geo(:,3),'s')
subplot(3,2,6)
plot(geo(:,2), geo(:,3),'s')

subplot(1,3,1)
plot3(geo(:,1), geo(:,2), geo(:,3),'s')