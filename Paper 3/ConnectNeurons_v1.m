function [con1, con2] = ConnectNeurons_v1(data, L)

%{
    This program will be used to connect the neurons in our model using
    various connectivity methods from the literature.  

    Max Henderson
    May 28, 2014
    Drexel University
%}

%% Get intersomatic distance of all neural pairs.
N =  length(data);
D = CalculatePeriodicDistances(N, data, L, 3); % Absolute distance differences

% E -> E
[con1,p,pr,pnr]=RP_AssembleNet_v2(D, length(D));

%% Connect neurons AFTER common neigbor algorithm...
CEE=Reorganize(con1,40,1,1,p,pr,pnr);
con2 = CEE;