function [EII, CII] = ConnectII(Dz, Dxy, inhibIndex, N, T)

%{
    This program will determine the connectivity between inhibitory neurons
    as specified in Rieubland et al 2014 using the 'non-uniform random'
    model.

    INPUT
    
    Dz : Intersomatic distances in the z-direction.
    Dxy : Intersomatic distances in the xy-plane.
    inhibIndex : Demarker of where neurons flip from exc. to inh.
    N : Number of neurons in the network.
    
    OUTPUT

    EII : Electrical connections between inh. neurons in network.
    CII : Chemical connections between inh. neurons in network.

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
        EII(i,j) = ConnectIISingle(Dz(i,j), Dxy(i,j), 1);  % Connects neurons based on electrical probabilities
    end
end
EII = AdjustConn(EII, N, inhibIndex);

%% Determine chemical synaptic connectivity.
for i = 1:n,
    for j = 1:n,
        CII(i,j) = ConnectIISingle(Dz(i,j), Dxy(i,j), 2);  % Connects neurons based on chemical probabilities
    end
end

%% Adjust for EE % of connections...
CII = AdjustConn(CII, N, inhibIndex);
nii = sum(sum(CII));
NII = 0.04*T; % Desired # of I->E connections
x1 = NII/nii;
CII = (rand(N).*CII)>(1-x1);