function [mc, mr, distCrys, distRan] = plotDist(dim, plotY)

N = dim^3;
rp = createRandomNetwork(dim, 100);
cp = createSCdim(dim);
[dc, dr] = neuronalDistance(cp, rp, dim);
% Reformat dendritic distances...
distCrys = zeros(N*(N-1)/2,1);
distRan = zeros(N*(N-1)/2,1);
count = 1;
for i = 1:length(distCrys)-1,
    for j = i+1 : N,
       distCrys(count) = dc(i,j);
       distRan(count) = dr(i,j);
       count = count + 1;
    end
end
mc = mean(distCrys);
mr = mean(distRan);
a = hist(distCrys, 100);
b = hist(distRan, 100);

max(max(distCrys))
max(max(distRan))

if plotY == 1,
    hold on
    x1 = 0;
    x2 = max(max([distCrys; distRan]));
    x3 = 0;
    x4 = max(max([a; b]));
    plotDistHist(distCrys, 0.1, 0.5, 0.5, 0.4, 0, 0, x1, x2, x3, x4)
    plotDistHist(distRan, 0.1, 0.1, 0.5, 0.4, 0, 1, x1, x2, x3, x4)
    text(0.11, 0.52, '(A)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times') 
    axis([x1 x2 x3 x4])
    text(0.11, 0.12, '(B)','FontSize', 20, 'FontWeight', 'bold', 'FontName','Times')   
    axis([x1 x2 x3 x4])

end
