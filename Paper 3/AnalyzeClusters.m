function [NC, CS] = AnalyzeClusters(idx)

%{
    This program will determine the number of clusters, NC, and the size of
    the clusters, CS, for a particular network after running the affinity
    propagation algorithm.

    Max Henderson
    May 24, 2014
    Drexel University
%}

%% Iteratively go through idx to determine each neurons cluster.
first = 1;
NC = 0;
for i = 1:length(idx),
    if ~isempty((find(idx==i, 1))),
        if first == 1,
            a = length(find(idx==i));
            CS = [idx(i) a];
            first = 0;
        else
            a = length(find(idx==i));
            CS = [CS; idx(i) a];
        end
        NC = NC + 1;
    end  
end   