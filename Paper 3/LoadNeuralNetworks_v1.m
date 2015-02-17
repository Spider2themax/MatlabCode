function [] = LoadNeuralNetworks_v1(directory_name)

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
    Last updated: Sept. 14, 2014
    Drexel University
%}

%% Load the files in the directory to get neural distributions.
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
fileCount = 0;
tic

%% Go through each file and generate connectivity matrices.
L = 240; %length of box from which original young microcolumnar networks were generated
%node = 19; % This will define the number of nodes 
%CIG = zeros(25,12);
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
                ID = data1(:,1);

                % Load YOUNG neurons...
                file_potentials = strcat(directory_name, '/neuBlock_', fileName(19:27), '_000.xyz'); % --- file with neuron to reproduce
                dataYoung = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                dataYoung = reshape(dataYoung, 3, length(dataYoung)/3)';
                dataYoung = ScaleToMicrons(dataYoung, L);
                
                % Test 2 different types of networks...

                %% Young...
                length(dataYoung)
                [Dyoung, inhibIndex, con1, con2] = ConnectNeurons(directory_name, dataYoung, fileCount, ID, L, 1, 1);
                
                % Save both the size of the network and the index wherein the
                % inhibitory neurons kick in.
                
                n = length(Dyoung);
                save = [n; inhibIndex];
                n1 = sprintf('%s/networkConstants%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, save);
                                               
                % Save distance results
                n1 = sprintf('%s/Dyoung%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, Dyoung);
                
                % Save distance results
                n1 = sprintf('%s/Data%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, dataYoung);
                
                % Calculate CIG for young networks
                %con1 = con1(1:inhibIndex-1, 1:inhibIndex-1);
                %con2 = con2(1:inhibIndex-1, 1:inhibIndex-1);
                %geo = dataYoung(1:inhibIndex-1, :);
                %CIG(fileCount, 1) = GetCIG(geo, con1, L, node, 1);
                %CIG(fileCount, 2) = GetCIG(geo, con1, L, node, 2);
                %CIG(fileCount, 3) = GetCIG(geo, con1, L, node, 3);
                %CIG(fileCount, 4) = GetCIG(geo, con2, L, node, 1);
                %CIG(fileCount, 5) = GetCIG(geo, con2, L, node, 2);
                %CIG(fileCount, 6) = GetCIG(geo, con2, L, node, 3);
                
                %% Random...
                dataRandom = L*rand(length(dataYoung), 3);
                length(dataRandom)
                [Drand,inhibIndex, con1, con2]   = ConnectNeurons(directory_name, dataRandom, fileCount, ID, L, 3, 1);
                
                n1 = sprintf('%s/Drand%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, Drand);
                
                n1 = sprintf('%s/DataRand%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, dataRandom);
                
                % Calculate CIG for random networks
                %con1 = con1(1:inhibIndex-1, 1:inhibIndex-1);
                %con2 = con2(1:inhibIndex-1, 1:inhibIndex-1);
                %geo = dataRandom(1:inhibIndex-1, :);
                %CIG(fileCount, 7)  = GetCIG(geo, con1, L, node, 1);
                %CIG(fileCount, 8)  = GetCIG(geo, con1, L, node, 2);
                %CIG(fileCount, 9)  = GetCIG(geo, con1, L, node, 3);
                %CIG(fileCount, 10) = GetCIG(geo, con2, L, node, 1);
                %CIG(fileCount, 11) = GetCIG(geo, con2, L, node, 2);
                %CIG(fileCount, 12) = GetCIG(geo, con2, L, node, 3);
                
                n1 = sprintf('%s/ID%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, ID);
                
        end
        
    end
end

disp('Finished!')