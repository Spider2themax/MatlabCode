function [] = GetIDs(directory_name)

%{
    This program will be used to load all neural network data into our
    algorithms for determining neural network connectivity.  Each neural
    network will have a large number of neurons that will be marked using
    two files representing neural placements before and after neurons are 
    iteratively moved according to methods outlined elsewhere
    (Henderson, Cruz, Urbanc 2014).  These files are then segmented further
    so that each microcolumnar ID number will be recorded for each neuron,
    so one can obtain how neurons move relative to individual microcolumns.

    Max Henderson
    May 27, 2014
    Drexel University
%}

%% Load the files in the directory to get neural distributions.
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
fileCount = 0;
tic

%% Go through each file and generate connectivity matrices.
PM1 = 0;
PM2 = 0;
count1 = 0;
L = 300; %length of box
CIC = zeros(10,4);
count2 = 1;
for i = 1:length(fileIndex)
    
    fileName = files(fileIndex(i)).name;
    
    if length(fileName) > 16,
        
        if strcmp(fileName(1:17),'neuBlockwithColID'),

                % Iterate current file count... 
                fileCount = fileCount + 1

                % Load perturbed neurons with micrcolumnar ID...
                file_potentials = strcat(directory_name, '/', fileName); % --- file with neuron to reproduce
                data1 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                data1 = reshape(data1, 4, length(data1)/4)';
                
                % Seperate data1 into old and micro IDs...
                dataOld = data1(:,2:4);
                dataOld = ScaleToMicrons(dataOld, 300);
                ID = data1(:,1);
                
                n1 = sprintf('%s/ID%d.txt',directory_name, fileCount);
                edit 'n1';                 
                dlmwrite(n1, ID);
                
        end
        
    end
end

disp('Finished!')