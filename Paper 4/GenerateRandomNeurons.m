function data = GenerateRandomNeurons(N, D)

%{
    This program will generate a N-by-3 matrix of neurons with random
    positions adhering to a density of 100,000 neurons / mm^3.

    Max Henderson
    February 4, 2014
    Drexel University
%}

V = N/D;
a = V^(1/3)*1000;
data = rand(N,3)*a;