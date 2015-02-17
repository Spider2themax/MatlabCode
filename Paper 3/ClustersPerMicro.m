function CPM = ClustersPerMicro(idx, geo)
 
%{
    This program will be used to determine the distribution of various
    clusters within a single microcolumn.  Say for instance that
    microcolumn number 1 has 10 neurons, and of those 10 neurons, they
    belong to 4 different clusters, than microcolumn 1 has 4 clusters.  We
    want to ascertain the distribution resulting from analyzing all
    microcolumns.
 
    idx - Index of cluster 
    geo - Geometry of microcolumnar networks
 
    Max Henderson
    May 28, 2014
    Drexel University
%}

%% Iterate through the network and determine the number of clusters per microcolumn.
CPM         = zeros(max(geo(:,1)),1);
currMicro   = 1;
lenMicro    = 0;
L           = 0;
clusterList = zeros(10,1);
for i = 1 : length(geo(:,1)),
    if geo(i,1) == currMicro,
        L = L + 1;
        if ~any(clusterList == idx(i))
            lenMicro = lenMicro + 1;
            clusterList(lenMicro) = idx(i);
        end
    else
        CPM(currMicro) = lenMicro/L;
        currMicro = currMicro + 1;
        L = 0;
        clusterList = zeros(10,1);
        lenMicro = 0;
    end
end
CPM(currMicro) = lenMicro/L;