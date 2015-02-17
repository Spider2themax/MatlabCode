function [] = LoadNeuralNetworks(directory_name)

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
L = 280; %length of box
node = 11;
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
                dataOld = ScaleToMicrons(dataOld, L);
                ID = data1(:,1);

                % Load YOUNG neurons...
                file_potentials = strcat(directory_name, '/neuBlock_', fileName(19:27), '_000.xyz'); % --- file with neuron to reproduce
                dataYoung = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                dataYoung = reshape(dataYoung, 3, length(dataYoung)/3)';
                dataYoung = ScaleToMicrons(dataYoung, L);
                
                % Test 3 different types of networks...

                % Young...
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
                
                
                con1 = con1(1:inhibIndex-1, 1:inhibIndex-1);
                con2 = con2(1:inhibIndex-1, 1:inhibIndex-1);
                geo = dataYoung(1:inhibIndex-1, :);
                disp('young..')
                GetCIG(geo, con1, L, node, 1)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 1, 1, 1, 1, 280, node)
                GetCIG(geo, con1, L, node, 2)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 2, 1, 1, 1, 280, node)
                GetCIG(geo, con1, L, node, 3)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 3, 1, 1, 1, 280, node)
                
                %disp('!!!!!!!!!!!!')
                GetCIG(geo, con2, L, node, 1)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 1, 1, 2, 1, 280, node)
                GetCIG(geo, con2, L, node, 2)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 2, 1, 2, 1, 280, node)
                GetCIG(geo, con2, L, node, 3)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 3, 1, 2, 1, L, node)

                % Old...
                %[Dold, inhibIndex, con1, con2]  = ConnectNeurons(directory_name, dataOld, fileCount, ID, L, 2);
                %[CIC3] = ConnInColumn(ID, con1);
                %[CIC4] = ConnInColumn(ID, con2);
                
                % Random...
                dataRandom = L*rand(length(dataYoung), 3);
                [Drand,inhibIndex, con1, con2]   = ConnectNeurons(directory_name, dataRandom, fileCount, ID, L, 3, 1);
                
                n1 = sprintf('%s/Drand%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, Drand);
                
                n1 = sprintf('%s/dataRand%d.txt',directory_name, fileCount);
                edit 'n1';          
                dlmwrite(n1, dataRandom);
                
                
                con1 = con1(1:inhibIndex-1, 1:inhibIndex-1);
                con2 = con2(1:inhibIndex-1, 1:inhibIndex-1);
                geo = dataRandom(1:inhibIndex-1, :);
                disp('rand..')
                GetCIG(geo, con1, L, node, 1)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 1, 1, 1, 3, 280, node)
                GetCIG(geo, con1, L, node, 2)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 2, 1, 1, 3, 280, node)
                GetCIG(geo, con1, L, node, 3)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 3, 1, 1, 3, 280, node)
                
                GetCIG(geo, con2, L, node, 1)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 1, 1, 2, 3, 280, node)
                GetCIG(geo, con2, L, node, 2)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 2, 1, 2, 3, 280, node)
                GetCIG(geo, con2, L, node, 3)
                GetGridConn('/data2/L/Brain/max/Paper2.5Data/Convergence/280/', 3, 1, 2, 3, L, node)
                
                
                %n1 = sprintf('%s/Dold%d.txt',directory_name, fileCount);
                %edit 'n1';          
                %dlmwrite(n1, Dold);
                
                
                
                %n1 = sprintf('%s/ID%d.txt',directory_name, fileCount);
                %edit 'n1';          
                %dlmwrite(n1, ID);
                
                count2 = count2 + 1;
                
        end
        
    end
end

disp('Finished!')