function [distances] = plotFigure6_v1(maxDim, con)

%{
    This program will show the algebriac connectivity of graphs using 
    either random, exponential, or nearest neighbor connectivity schemes
    in our basic model for neural growth.  As network sizes get larger and
    the number of connections grows, the dendritic trees will also get
    larger.

    Max Henderson
    Drexel University
    Oct 4, 2013
%}

distances = zeros(maxDim-3, 6);
for dim = 4:maxDim,
    disp('Currently testing networks of size:')
    dim
    disp('...................................')
    % Generate positions and dendrites.
    cpositions = createSCdim(dim);
    rpositions = createRandomNetwork(dim, 100);
    DendCrys = calculateDendrites(dim^3, cpositions);
    DendRand = calculateDendrites(dim^3, rpositions);
    % Determine connectivity patterns for:

    % Random.
    [Con, Dend] = randomConnections_Figure2(cpositions, con, DendCrys);
    distances(dim - 3, 1) = analyzeCoboundaryMatrix_v1(Con);
    [Con, Dend] = randomConnections_Figure2(rpositions, con, DendRand);
    distances(dim - 3, 2) = analyzeCoboundaryMatrix_v1(Con);

    % Exponential.
    [Con, Dend] = exponentialConnections_Figure2(cpositions, con, 5, DendCrys);
    distances(dim - 3, 3) = analyzeCoboundaryMatrix_v1(Con);  
    [Con, Dend] = exponentialConnections_Figure2(rpositions, con, 5, DendRand);
    distances(dim - 3, 4) = analyzeCoboundaryMatrix_v1(Con);

    % Nearest neighbor.
    [Con, Dend] = nearestConnections_Figure2(cpositions, con, DendCrys);
    distances(dim - 3, 5) = analyzeCoboundaryMatrix_v1(Con); 
    [Con, Dend] = nearestConnections_Figure2(rpositions, con, DendRand);
    distances(dim - 3, 6) = analyzeCoboundaryMatrix_v1(Con);
end