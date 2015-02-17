function numNeighbors = CommonNeighborsNetwork(C, N)

%{
    This program will determine the number of common neighbors between 2
    particular neurons in a network.

    Max Henderson
    January 6, 2014
    Drexel University
%}

%% Determine numbers of common neighors.
numNeighbors = zeros(N);
forHist = zeros(N,1);
count = 1;
for i = 1 : N-1,
    for j = i + 1: N,
        % Check neighbors # of common neighbors
        numNeighbors(i,j) = CommonNeighbors(C, i, j);
        numNeighbors(j,i) = numNeighbors(i,j);
        forHist(count) = numNeighbors(i,j);
        count = count + 1;
    end
end