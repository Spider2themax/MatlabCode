function [] = plotFigure7_v0(cn, ce, cr, rn, re, rr)

hold on
% Crystal NN.
plotFigure7_v1(cn, 1, 1)
% Crystal EXP.
plotFigure7_v1(ce, 1, 2)
% Crystal Ran.
plotFigure7_v1(cr, 1, 3)
% Random NN.
plotFigure7_v1(rn, 2, 1)
% Random EXP.
plotFigure7_v1(re, 2, 2)
% Random Ran.
plotFigure7_v1(rr, 2, 3)

hold on

subplot('Position',[0.1 (0.1 + (3-1)*0.25) 0.4 0.25])
axis([0 0.1 0.11 0.26])
%ax = axes('position',[0,0,1,1],'visible','off');

subplot('Position',[0.1 (0.1 + (2-1)*0.25) 0.4 0.25])
%ax = axes('position',[0,1,1,1],'visible','off');
axis([0 0.1 0.11 0.26])
ylabel('SPIKE-distance', 'FontSize', 16, 'FontWeight', 'bold', 'FontName','Times')

subplot('Position',[0.1 (0.1 + (1-1)*0.25) 0.4 0.25])
axis([0 0.1 0.11 0.26])
xlabel('g (Siemens)', 'FontSize', 16, 'FontWeight', 'bold', 'FontName','Times')

text(0.03, 0.83, '(A)','FontSize', 16, 'FontWeight', 'bold', 'FontName','Times') 
text(0.03, 0.53, '(B)','FontSize', 16, 'FontWeight', 'bold', 'FontName','Times') 
text(0.03, 0.23, '(C)','FontSize', 16, 'FontWeight', 'bold', 'FontName','Times') 

