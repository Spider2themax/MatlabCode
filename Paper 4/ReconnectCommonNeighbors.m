function C = ReconnectCommonNeighbors(C, N, numNeighbors, totalCon)

%{
    This program will reconnect N neurons in a network C based on the
    number of common neighbors, numNeighbors, between them.  The two
    neurons with the largest number of common neighbors will get a
    probability of connecting as 1, and neurons that have no common
    neighbors will have a connectivity of 0.

    Max Henderson
    January 6, 2014
    Drexel University
%}

%% Determine new connectivity from common neighbors.
% Want to keep track of connections LOST vs connections GAINED
lost = 0;
gained = 0;
x = sum(sum(numNeighbors))/totalCon;
numNeighbors = numNeighbors/x;
for i = 1:N,
    for j = 1:N,
        probCon = numNeighbors(i,j);
        probRan = rand(1,1);
        if probCon > probRan,
            if C(i,j) == 0,
                gained = gained + 1;
            end
            C(i,j) = 1;
        else
            if C(i,j) == 1,
                lost = lost + 1;
            end
            C(i,j) = 0;
        end
    end
end