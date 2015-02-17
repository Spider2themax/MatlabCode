function [N, inhibIndex] = ConnectNeurons_v4(directory_name, data, fileCount, con)

%{
    This program will be used to connect the neurons in our model using
    various connectivity methods from the literature.  

    Max Henderson
    May 19, 2014
    Drexel University
%}

%% Connect neurons using rules for E->E, E->I, I->E, or I->I rules.
N = length(data);
[D,inhibIndex, young_chem_con1, young_elec_con1] = ConnectNeurons(directory_name, data, fileCount, ID, L);
Ddiff = CalculatePeriodicDistancesAged(N, D, data(:, 5:7), directory_name, fileCount);

%% Age networks.
[old_chem1_age1, old_elec1_age1] = AgeConnectivityCont(young_chem_con1, young_elec_con1, Ddiff);
[old_chem1_age2, old_elec1_age2] = AgeConnectivityDisc(young_chem_con1, young_elec_con1, Ddiff);

%% Change stimulus based on broken long-range connections and movement.
stims = GetStim(Ddiff);

%% Write out all data to be used in NEURON simulations.
n1 = sprintf('%s/young%d_chem_con1_%d.txt',directory_name, con, fileCount);
edit 'n1';          
dlmwrite(n1, young_chem_con1);

n1 = sprintf('%s/young%d_elec_con1_%d.txt',directory_name, con, fileCount);            
edit 'n1';          
dlmwrite(n1, young_elec_con1);

n1 = sprintf('%s/old%d_chem_age1_%d.txt',  directory_name, con, fileCount);            
edit 'n1';          
dlmwrite(n1, old_chem1_age1);

n1 = sprintf('%s/old%d_elec_age1_%d.txt',  directory_name, con, fileCount);            
edit 'n1';          
dlmwrite(n1, old_elec1_age1);

n1 = sprintf('%s/old%d_chem_age2_%d.txt',  directory_name, con, fileCount);            
edit 'n1';          
dlmwrite(n1, old_chem1_age2);

n1 = sprintf('%s/old%d_elec_age2_%d.txt',  directory_name, con, fileCount);            
edit 'n1';          
dlmwrite(n1, old_elec1_age2);

n1 = sprintf('%s/data%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, data);