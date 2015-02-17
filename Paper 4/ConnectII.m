function [EII, CII] = ConnectII(Dz, Dxy, inhibIndex, N)

%{
    This program will determine the connectivity between inhibitory neurons
    as specified in Rieubland et al 2014 using the 'non-uniform random'
    model.

    Max Henderson
    May 19, 2014
    Drexel University
%}

%% Construct connectivity matrices for population and reformat Dz and Dxy.
Dz  = Dz(inhibIndex:N, inhibIndex:N);
Dxy = Dxy(inhibIndex:N, inhibIndex:N);
n   = N - inhibIndex + 1;
EII = zeros(n);
CII = zeros(n);

%% Determine electrical synaptic connectivity.
for i = 1:n-1,
    for j = i + 1:n,
        EII(i,j) = ConnectIISingle(Dz(i,j), Dxy(i,j), 1);
    end
end
EII = AdjustConn(EII, N, inhibIndex);

%% Determine chemical synaptic connectivity.
for i = 1:n,
    for j = 1:n,
        CII(i,j) = ConnectIISingle(Dz(i,j), Dxy(i,j), 2);
    end
end
CII = AdjustConn(CII, N, inhibIndex);