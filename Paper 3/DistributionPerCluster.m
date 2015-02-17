function realDPC = DistributionPerCluster(idx, dist)

%{
    This program will be used to determine the distribution of distances
    within a particular microcolumn.  
 
    idx - Index of cluster 
    geo - Geometry of microcolumnar networks
 
    Max Henderson
    May 28, 2014
    Drexel University
%}

%% Iterate through the network and determine average distance of neurons per cluster.
DPC         = zeros(length(idx),1);
count       = 1;
clusterList = zeros(10,1);
for i = 1 : length(idx),
    % First, determine all nodes in cluster. 
    for j = 1:length(idx),
       if idx(j) == i,
           clusterList(count) = j;
           count = count + 1;
       end
    end
    % After forming list of nodes, determine avg distance between them.
    clusterList = clusterList(1:count-1); %Account for unused entries.
    d = 0;
    count = 0;
    for j = 1 : length(clusterList) -1,
       for k = j + 1 : length(clusterList), 
          d = d + dist(j,k);
          count = count + 1;
       end
    end
    
    % Save data...
    DPC(i) = d/count;
    
    % Reset variables..
    count       = 1;
    clusterList = zeros(10,1);
end

%% Save only real values of DPC.
realVals = (DPC > 0);
realDPC  = zeros(sum(realVals), 1);
count = 1;
for i = 1 : length(DPC),
    if realVals(i) == 1,
        realDPC(count) = DPC(i);
        count = count + 1;
    end
end