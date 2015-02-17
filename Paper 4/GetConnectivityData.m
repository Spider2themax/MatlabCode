function [conn, N] = GetConnectivityData(currentDir, fileIndex, age)

%{
    This function will import the spike firings of a neural network and
    optionally show the raster plot of the network.

    Max Henderson
    1/4/14
    Drexel University
%}

%% Get network size.
file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt');     
a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
N = a(1);

%% Read in the potentials across the neurons from the simulation.
if age == 1,
    file_potentials = strcat(currentDir,'/young_chem_con1_', int2str(fileIndex), '.txt');
elseif age == 2,
    file_potentials = strcat(currentDir,'/old_chem1_age1_',  int2str(fileIndex), '.txt');    
elseif age == 3,
    file_potentials = strcat(currentDir,'/old_chem1_age2_',  int2str(fileIndex), '.txt');    
elseif age == 4,
    file_potentials = strcat(currentDir,'/young_elec_con1_', int2str(fileIndex), '.txt');
elseif age == 5,
    file_potentials = strcat(currentDir,'/old_elec1_age1_',  int2str(fileIndex), '.txt');
else   
    file_potentials = strcat(currentDir,'/old_elec1_age2_',  int2str(fileIndex), '.txt');
end
t = load(file_potentials);
conn = reshape(t, N, N);