function [CC_list] = CC_neighbors(s, con, N)

%{ 
    This program will consider the spike trains of N neurons in a neural
    network connected according to the connectivity matrix, con.  We will
    use Dijkstra's algorithm to determine what the neighbor distance is
    between all neurons.  After this, we will calculate the correlation
    coefficient between all neural spike trains.

    Max Henderson
    Drexel University
    11/18/13
%}

%% Determine neighbor distance for all neural pairs.
neighbors = zeros(N);
for i = 1 : N - 1,
    for j = i + 1 : N,
        neighbors(i,j) = dijkstra(con, i, j);  
        if neighbors(i,j) == Inf,
            neighbors(i,j) = -1;
        end
    end
end

%% Bin spikes in terms of simulation time.
simTime = 500;
bins = binSpikeTimes(s, simTime, N);

%% Calculate correlation coefficient between all neurons.
CC = zeros(N);
CC_list = zeros(2,1);
count = 1;
for i = 1 : N - 1,
    for j = i + 1 : N,
        r = corrcoef(bins(:,i), bins(:,j));
        CC(i,j) = abs(r(1,2));
        CC_list(count) = CC(i,j);
        count = count + 1;
    end
end

%% Determine average value of CC as a function of neighbors.
%{
maxPlots = max(max(neighbors));
colorIndex = 1;
for neigh = -1 : maxPlots,
    currHist = zeros(2,1);
    count = 1;
    for i = 1 : N - 1,
        for j = i + 1 : N,
            if neighbors(i,j) ==  neigh,
                currHist(count) = CC(i,j);
                count = count + 1;
            end
        end
    end
    if colorIndex == 1,
        hold on
        hist(currHist);
        h = findobj(gca,'Type','patch');
        set(h,'FaceColor','r','EdgeColor','r')
        colorIndex = 2;
    elseif colorIndex == 2,
        hold on
        hist(currHist);
        h = findobj(gca,'Type','patch');
        set(h,'FaceColor','g','EdgeColor','g')
        colorIndex = 2;
    elseif colorIndex == 3,
        hold on
        hist(currHist);
        h = findobj(gca,'Type','patch');
        set(h,'FaceColor','b','EdgeColor','b')
        colorIndex = 4;
    else
        hold on
        hist(currHist);
        h = findobj(gca,'Type','patch');
        set(h,'FaceColor','c','EdgeColor','c')
        colorIndex = 1;
    end
end
%}
hist(CC_list, 100)