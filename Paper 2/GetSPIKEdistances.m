function data = GetSPIKEdistances(currentDir, d_para, f_para)

%{
    This function will use the SPIKE distance (Kruez et al 2013) generated
    from various networks using different geometries and connectivities.

    Max Henderson
    5/31/14
    Drexel University
%}

%% Get SPIKE distances.
%stims = [10; 15; 20; 25; 30; 35; 40; 45; 50];

stims = 25;

data = zeros(10, length(stims), 6);

numNeuronsToKeep = 100;

for fileIndex = 1:10,
    
    file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt')  
    
    a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
    
    N = a(1);
    
    for j = 1:length(stims),
        
        for age = 1:3,
            
            for con = 1:2,
            
                disp('Currently running con ...')
                con
                disp('and currently running age ...')
                age

                [spikes] = GetSimulationData(currentDir, N, fileIndex, con, age, stims(j), 2000, 0);

                if N > numNeuronsToKeep,

                    for iter = 1:25,
                        
                        iter

                        spikesTemp = GetSPIKESrandom(spikes, numNeuronsToKeep);

                        results=f_distances_MEX(spikesTemp,d_para,f_para);

                        data(fileIndex, 2*(age-1) + con) = data(fileIndex, 2*(age-1) + 1) + results;

                    end
                    
                    data(fileIndex, 2*(age-1) + con) = data(fileIndex, 2*(age-1) + con)/25;

                else

                    results=f_distances_MEX(spikes,d_para,f_para);

                    data(fileIndex, 2*(age-1) + con) = results.overall_dissimilarities(1);

                end

            end
            
        end
        
    end
    
end