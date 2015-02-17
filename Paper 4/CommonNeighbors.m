function numNeighbors = CommonNeighbors(C, i, j)

%{
    This program will determine the number of common neighbors between 2
    particular neurons in a network.

    Max Henderson
    January 6, 2014
    Drexel University
%}

%% Determine number of common neighbors for neuron i and j.
numNeighbors = 0;
for k = 1 : length(C),
    if (((C(i, k) == 1) || (C(k, i) == 1)) && (i ~= k)),
        if (((C(j, k) == 1) || (C(k, j) == 1)) && (j ~= k)),
            numNeighbors = numNeighbors + 1;
        end      
    end
end