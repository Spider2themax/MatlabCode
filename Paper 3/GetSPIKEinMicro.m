function [data, needToRunAgain] = GetSPIKEinMicro(currentDir, d_para, f_para)

%{
    This function will use the SPIKE distance (Kruez et al 2013) generated
    from various networks using different geometries and connectivities.

    Max Henderson
    5/31/14
    Drexel University
%}

%% Get SPIKE distances.
stims = [5 10 15 20 25 30 35 40 45 50 75 100];

%stims = [5 10 15 20 25 30 35 40 45 50 75];

%stims = [100];

data = zeros(10, length(stims), 6);

numNeuronsToKeep = 100;

needToRunAgain = zeros(1,3);

numRunAgain = 1;

for fileIndex = 1:10,
    
    % Get network constants...
    file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt');        
    a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
    N = a(1);
    
    % Get columnar IDs...
    file_potentials = strcat(currentDir,'ID', int2str(fileIndex), '.txt');        
    ID = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
    
    for j = 1:length(stims),
        
        for age = 1:3,
            
            for con = 1:2,
            
                disp('Currently running connectivity matrix ...')
                fileIndex
                disp('Currently running stimulus ...')
                stims(j)
                disp('and currently running age ...')
                age
                    
                [spikes] = GetSimulationData(currentDir, N, fileIndex, con, age, stims(j), 2000, 0);

                % Iterate through all columns in network...
                maxColumns = max(ID);
                    
                %n = maxColumns;
                
                n = N;
                
                % Get number of columns with more than one neuron for
                % normalization purposes...
                
                for cols = 1 : maxColumns,
                    
                    spikesTemp = GetColumnSpikes(spikes, ID, cols);
                    
                    [l, w] = size(spikesTemp);
                    
                    if l == 1,
                        
                        n = n - 1;
                        
                    end
                    
                end

                for cols = 1 : maxColumns,

                    spikesTemp = GetColumnSpikes(spikes, ID, cols);
                    
                    [l, w] = size(spikesTemp);
                    
                    if l > 1,

                        results=f_distances_MEX(spikesTemp,d_para,f_para);
                        
                        % Normalize each SPIKE in relation to number of
                        % total neurons...
                        
                        colSpike = results.overall_dissimilarities/n*l;

                        data(fileIndex, j, 2*(age-1) + con) = data(fileIndex, j, 2*(age-1) + con) + colSpike;
                        
                    end
                    
                end

                %data(fileIndex, j, 2*(age-1) + con) = data(fileIndex, j, 2*(age-1) + con)/n;


                %needToRunAgain(numRunAgain,1) = fileIndex;
                %needToRunAgain(numRunAgain,2) = stims(j);
                %needToRunAgain(numRunAgain,3) = age;
                %numRunAgain = numRunAgain + 1;

            end
            
        end
        
    end
    
end