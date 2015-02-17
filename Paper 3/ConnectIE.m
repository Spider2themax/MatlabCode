function [CIE] = ConnectIE(D, inhibIndex, N)


%{
    This program will determine the connectivity between exc. neurons
    receiving input from nearby inh. neurons.

    Max Henderson
    May 29, 2014
    Drexel University
%}

%% Connect neurons that are within the critical distance with prob P.
P     = 0.1; % Probability of forming a connection if within ~100 microns
critD = 100; % Critical distance for connection
CIE   = zeros(N); % Create matrix for storing connections
for i = inhibIndex:N,
    for j = 1:inhibIndex-1,
        if D(i,j) < critD,
           r = rand(1,1);
           if P > r,
               CIE(i,j) = 1;
           end
        end
    end
end