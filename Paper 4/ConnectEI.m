function [CEI] = ConnectEI(D, inhibIndex, N)


%{
    This program will determine the connectivity between inhibitory neurons
    receiving input from nearby excitory neurons, as shown in Bock et al 2011
    and Hofer et al 2011.

    Max Henderson
    May 19, 2014
    Drexel University
%}

%% Connect neurons that are within the critical distance with prob P.
P1     = 0.2; % Probability of forming a connection if within ~100 microns
P2     = 0.1;
critD  = 80; % Critical distance for connection
CEI    = zeros(N); % Create matrix for storing connections
for i  = 1:inhibIndex-1,
    for j = inhibIndex:N,
        if D(i,j) < critD,
           % E -> I
           r = rand(1,1);
           if P1 > r,
               CEI(i,j) = 1;
           end
           % I -> E
           r = rand(1,1);
           if P2 > r,
               CEI(j,i) = 1;
           end
        end
    end
end