function [] = ConnectNeurons_v3(directory_name, data, fileCount, con)

%{
    This program will be used to connect the neurons in our model using
    various methods which will be outlined later more specifically.

    Max Henderson
    May 20, 2014
    Drexel University
%}

%% Get intersomatic distance of all neural pairs.
N =  length(data);
[D, Ddiff] = GetPeriodicDistances(data, N, directory_name, fileCount);

%% Connect neurons based off of different connectivity methods.

% Connect using purely distant-dependent function...
if con == 1,
    young_chem_con1 = DistanceDependent_v1(D,N, 1);
    young_elec_con1 = DistanceDependent_v1(D,N, 0);
end

% Connect all-to-all neurons within a microcolumn....
if con == 2,
    young_chem_con1 = DistanceDependent_v1(D,N, 1);
    young_elec_con1 = DistanceDependent_v1(D,N, 0);
    for i = 1:N,
        neuron1 = data(i,1);
        for j = 1:N,
            neuron2 = data(j,1);
            if neuron1 == neuron2 && neuron1 ~= -1,
                young_chem_con1(i,j) = 1;
            end
        end
    end
end
% Connect using commong neighbor algorithm...
if con == 3,
    [conn, dist, p, pr,pnr] = RP_AssembleNet_v1 (data, 0);
    young_chem_con1 =Reorganize (conn, 50, 1,1,p,pr,pnr,dist);
    young_elec_con1 = DistanceDependent_v1(D,N, 0);
end
    
[old_chem1_age1, old_elec1_age1] = AgeConnectivityCont(young_chem_con1, young_elec_con1, Ddiff);
[old_chem1_age2, old_elec1_age2] = AgeConnectivityDisc(young_chem_con1, young_elec_con1, Ddiff);


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