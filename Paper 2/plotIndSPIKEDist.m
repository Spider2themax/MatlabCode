function [muhat,sigmahat] = plotIndSPIKEDist(dist, N)

listDist = zeros(N*(N-1)/2,1);
count = 1;
for i = 1 : N - 1,
    for j = i + 1 : N,
        listDist(count) = dist(i,j);
        count = count + 1;
    end
end
[muhat,sigmahat] = normfit(listDist);
histfit(listDist, 100)