function [] = plotFigure1_v0()

cpositions = createSCdim(10);
    
rpositions = createRandomNetwork(10, 100);

hold on
subplot(1,2,1)
plot3(cpositions(:,1), cpositions(:,2), cpositions(:,3),'s')
axis([0 max(cpositions(:,1)) 0 max(cpositions(:,2)) 0 max(cpositions(:,3))])
set(gca, 'FontSize', 16, 'FontName', 'Times')

subplot(1,2,2)
plot3(rpositions(:,1), rpositions(:,2), rpositions(:,3),'s')
axis([0 max(cpositions(:,1)) 0 max(cpositions(:,2)) 0 max(cpositions(:,3))])
set(gca, 'FontSize', 16, 'FontName', 'Times')
