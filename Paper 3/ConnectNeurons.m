function [D,inhibIndex, con1, con2, C1, C2] = ConnectNeurons(directory_name, data, fileCount, ID, L, Con, writeOut)

%{
    This program will be used to connect the neurons in our model using
    various connectivity methods from the literature.  

    Max Henderson
    Last updated: Sept. 14, 2014
    Drexel University
%}

%% Get intersomatic distance of all neural pairs.
N =  length(data);
Dz = CalculatePeriodicDistances(N, data, L, 1); % Absolute distance differences
Dxy = CalculatePeriodicDistances(N, data, L, 2); % Absolute distance differences
D = CalculatePeriodicDistances(N, data, L, 3); % Absolute distance differences

%% Connect neurons BEFORE common neigbor algorithm...
inhibIndex = GetInhibIndex(ID); % Get inhibitory index 

% E -> E
[con1,p,pr,pnr]=RP_AssembleNet_v2(D(1:inhibIndex-1, 1:inhibIndex-1), inhibIndex-1);
temp = zeros(N);
temp(1:inhibIndex -1, 1:inhibIndex -1) = con1;
CEE = temp;
nee = sum(sum(CEE));  % Determine number of E->E connections
T = ceil(nee/0.7); % Figure out number of total desired connections to keep ratio of E->E 70% of total connections

% E -> I and I -> E
CEI = ConnectEI_v1(D, inhibIndex, N, T);

% I -> I
[EII, CII] = ConnectII(Dz, Dxy, inhibIndex, N, T);

% Remove some stuff for memory purposes...
clear Dz
clear Dxy

% Combine all connections....
C1 = CEE + CEI + CII;

sum(sum(C1))/(2*N*(N-1))
sum(sum(CEE))%/sum(sum(C1))
sum(sum(CEI))%/sum(sum(C1))
sum(sum(CII))%/sum(sum(C1))


%% Connect neurons AFTER common neigbor algorithm...
CEE=Reorganize(con1,40,1,1,p,pr,pnr);
con2 = CEE;
temp = zeros(N);
temp(1:inhibIndex -1, 1:inhibIndex -1) = CEE;
CEE = temp;

% Combine all connections....
C2 = CEE + CEI + CII;
    
%% Write out all data to be used in NEURON simulations.
if writeOut == 1,
    n1 = sprintf('%s/C1_%d_%d.txt',directory_name, Con, fileCount);
    edit 'n1';          
    dlmwrite(n1, C1);

    n1 = sprintf('%s/C2_%d_%d.txt',directory_name, Con, fileCount);
    edit 'n1';          
    dlmwrite(n1, C2);

    n1 = sprintf('%s/E_%d_%d.txt',directory_name, Con, fileCount);
    edit 'n1';          
    dlmwrite(n1, EII);
    
    n1 = sprintf('%s/data%d.txt',directory_name, fileCount);            
    edit 'n1';          
    dlmwrite(n1, data);
end