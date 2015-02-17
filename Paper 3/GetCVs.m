function data = GetCVs(currentDir)

%{
    This function will determine the average CV for neurons in the network.

    Max Henderson
    5/31/14
    Drexel University
%}

%% Get SPIKE distances.
%stims = [10; 15; 20; 25; 30; 35; 40; 45; 50];

stims = 25;

data = zeros(10, length(stims), 6);

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
                    
                [CV] = CalculateCV(spikes, N)

                data(fileIndex, 2*(age-1) + con) = data(fileIndex, 2*(age-1) + 1) + CV;

            end
            
        end
        
    end
    
end