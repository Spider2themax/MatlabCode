function [D,inhibIndex, C2, EII] = ConnectNeurons(directory_name, data, fileCount, ID, L)

%{
    This program will be used to connect the neurons in our model using
    various connectivity methods from the literature.  

    Max Henderson
    May 28, 2014
    Drexel University
%}

%% Get intersomatic distance of all neural pairs.
N =  length(data);
Dz = CalculatePeriodicDistances(N, [ID data], L, 1); % Absolute distance differences
Dxy = CalculatePeriodicDistances(N, [ID data], L, 2); % Absolute distance differences
D = CalculatePeriodicDistances(N, [ID data], L, 3); % Absolute distance differences

mean(mean(D))

%% Connect neurons BEFORE common neigbor algorithm...
inhibIndex = GetInhibIndex(ID); % Get inhibitory index 

% E -> E
[con,p,pr,pnr]=RP_AssembleNet(0, D(1:inhibIndex-1, 1:inhibIndex-1), inhibIndex-1);
con1 = con;
temp = zeros(N);
temp(1:inhibIndex -1, 1:inhibIndex -1) = con;
CEE = temp;

% E -> I and I -> E
CEI = ConnectEI(D, inhibIndex, N);

% I -> I
[EII, CII] = ConnectII(Dz, Dxy, inhibIndex, N);

% Combine all connections....
C1 = CEE + CEI + CII;

%% Connect neurons AFTER common neigbor algorithm...
CEE=Reorganize(con,20,1,1,p,pr,pnr);
con2 = CEE;
temp = zeros(N);
temp(1:inhibIndex -1, 1:inhibIndex -1) = CEE;
CEE = temp;

% Combine all connections....
C2 = CEE + CEI + CII;n1 = sprintf('%s/C1_%d_%d.txt',directory_name, Con, fileCount);
edit 'n1';          
dlmwrite(n1, C1);
    
%% Write out all data to be used in NEURON simulations.

n1 = sprintf('%s/C0_%d.txt',directory_name, fileCount);
edit 'n1';          
dlmwrite(n1, C2);

n1 = sprintf('%s/E0_%d.txt',directory_name, fileCount);
edit 'n1';          
dlmwrite(n1, EII);

n1 = sprintf('%s/data%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, data);