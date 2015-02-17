function [] = ConnectNeurons_v2(directory_name, data, fileCount)

%{
    This program will be used to connect the neurons in our model using
    various methods which will be outlined later more specifically.

    Max Henderson
    January 1, 2014
    Drexel University
%}

%% Get intersomatic distance of all neural pairs.
N =  length(data);
[D, Ddiff] = GetPeriodicDistances(data, N);

%% Connect neurons based off of different connectivity methods.
young_chem_con1 = DistanceDependent(D,N);
young_elec_con1 = DistanceDependent(D,N);
[old_chem1_age1, old_elec1_age1] = AgeConnectivityCont(young_chem_con1, young_elec_con1, Ddiff);
[old_chem1_age2, old_elec1_age2] = AgeConnectivityDisc(young_chem_con1, young_elec_con1, Ddiff);

%% Write out all data to be used in NEURON simulations.
n1 = sprintf('%s/young_chem_con1_%d.txt',directory_name, fileCount);
edit 'n1';          
dlmwrite(n1, young_chem_con1);

n1 = sprintf('%s/young_elec_con1_%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, young_elec_con1);

n1 = sprintf('%s/old_chem1_age1_%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, old_chem1_age1);

n1 = sprintf('%s/old_elec1_age1_%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, old_elec1_age1);

n1 = sprintf('%s/old_chem1_age2_%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, old_chem1_age2);

n1 = sprintf('%s/old_elec1_age2_%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, old_elec1_age2);

n1 = sprintf('%s/data%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, data);