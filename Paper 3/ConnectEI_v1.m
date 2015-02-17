function [CEI] = ConnectEI_v1(D, inhibIndex, N, T)


%{
    This program will determine the connectivity between inhibitory neurons
    receiving input from nearby excitory neurons, as shown in Bock et al 2011
    and Hofer et al 2011.

    INPUT
    
    D : Intersomatic distances between neurons in network.
    inhibIndex : Demarker of where neurons flip from exc. to inh.
    N : Number of neurons in the network.
    
    OUTPUT

    CEI : Connections between exc. and inh. neurons in network.

    Max Henderson
    Last updated: Sept. 14, 2014    
    Drexel University
%}

%% Initialize variables.
critD  = 50; % Critical distance for connection
CEI    = zeros(N); % Create matrix for storing connections

%% Determine potential connectivity for EI and IE.
for i  = 1:inhibIndex-1,
    for j = inhibIndex:N,
        if D(i,j) < critD,
           CEI(i,j) = 1;
           CEI(j,i) = 1;
        end
    end
end
CEI = CEI - diag(diag(CEI)); % Make sure nothing on diagonal.

%% Determine connectivity ratios from total possible connections.
EI = triu(CEI);
IE = tril(CEI);
nei = sum(sum(EI));
NEI = 0.1*T; % Desired # of E->I connections
NIE = 0.16*T; % Desired # of I->E connections
x1 = NEI/nei;
x2 = NIE/nei;
if x1 < 1,
    EI = (rand(N).*EI)>(1-x1);
else
    IE = (rand(N).*IE)>(1-x2);
end
CEI = EI + IE;