function [t, n, indexInh] = LoadNeuralNetworks(directory_name, numMicros)

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
    December 28, 2013
    Drexel University
%}

%% Load the files in the directory to get neural distributions.
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
fileCount = 0;
tic

%% Go through each file and generate connectivity matrices.
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

                % Load YOUNG neurons...
                file_potentials = strcat(directory_name, '/neuBlock_', fileName(19:27), '_000.xyz'); % --- file with neuron to reproduce
                dataYoung = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                dataYoung = reshape(dataYoung, 3, length(dataYoung)/3)';
                dataYoung = ScaleToMicrons(dataYoung, 300);

                % Take this data and form connectivity matrix for neurons
                % before and after perturbation...

                % Common neighbor connectivity
                [n, indexInh] = ConnectNeurons_v4(directory_name, dataKeep, fileCount, 3);

                % Save both the size of the network and the index wherein the
                % inhibitory neurons kick in.
                save = [n; indexInh];
                n1 = sprintf('%s/networkConstants%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, save);

        end
        
    end
end
t = toc;
disp('Finished!')