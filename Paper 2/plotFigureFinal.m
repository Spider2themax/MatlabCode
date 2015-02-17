function [] = plotFigureFinal(cn, cn2, ce, ce2, cr, cr2, rn, rn2, re, re2, rr, rr2)

hold on
plotFigureFinal1_v2(cn, cn2, ce, ce2, cr, cr2, rn, rn2, re, re2, rr, rr2)
plotFigureFinal2_v2(cn, cn2, ce, ce2, cr, cr2, rn, rn2, re, re2, rr, rr2)
plotFigureFinal3_v0(cn, cn2, ce, ce2, cr, cr2, rn, rn2, re, re2, rr, rr2)

hold on
subplot(1,3,1)
ylabel('log(S)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
xlabel('log(g) (Siemens)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName','Times')
subplot(1,3,2)
ylabel('log(S)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
xlabel('log(D) (micrometers)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName','Times')
subplot(1,3,3)
ylabel('log(S)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
xlabel('log(a)', 'FontSize', 14, 'FontWeight', 'bold', 'FontName','Times')
set(gca,'LineWidth',2,'FontSize',14, 'FontWeight', 'bold', 'FontName','Times')

text(0.03, 0.93, '(A)','FontSize', 16, 'FontWeight', 'bold', 'FontName','Times') 
text(0.03, 0.63, '(B)','FontSize', 16, 'FontWeight', 'bold', 'FontName','Times') 
text(0.03, 0.23, '(C)','FontSize', 16, 'FontWeight', 'bold', 'FontName','Times') 
