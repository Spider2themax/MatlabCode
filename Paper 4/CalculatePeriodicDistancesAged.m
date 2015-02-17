function D = CalculatePeriodicDistancesAged(N, Dyoung, old, directory_name, fileCount)

%{
    This program will determine the change in intersomatic distance of
    neurons that have undergone the aging process.  We must therefore look
    at the 'young' brain as well as the 'old' brain to understand how
    neural pairs have moved in relation to each other, and their original
    positions.

    Max Henderson
    February 16, 2014
    Drexel University
%}

%% Calculate difference in distances, D.
Dold = CalculatePeriodicDistances(N, old);
D = abs(Dyoung - Dold);

%% Write old and young distances for synaptic delays.
n1 = sprintf('%s/youngDist_%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, Dyoung);

n1 = sprintf('%s/oldDist_%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, Dold);