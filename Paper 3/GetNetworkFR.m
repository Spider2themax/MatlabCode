function [data, needToRunAgain] = GetNetworkFR(currentDir)

%{
    This function will determine the average firing rate for a variety of
    neural networks.

    Max Henderson
    6/20/14
    Drexel University
%}

%% Get SPIKE distances.
stims = [5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100];

%stims = [5 10 15 20 25 30 35 40 45 50 75];

%stims = [50 75];

data = zeros(25, length(stims), 6);

numNeuronsToKeep = 100;

needToRunAgain = zeros(1,3);

numRunAgain = 1;

for fileIndex = 1:25,
    
    % Get network constants...
    file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt');        
    a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
    N = a(1);

    for j = 1:length(stims),
        
        for age = [1 3],
            
            for con = 1:2,
            
                disp('Currently running connectivity matrix ...')
                fileIndex
                disp('Currently running stimulus ...')
                stims(j)
                disp('and currently running age ...')
                age
                    
                [FR] = GetFR(currentDir, N, fileIndex, con, age, stims(j), 2000);
                
                data(fileIndex, j, 2*(age-1) + con) = FR;

            end
            
        end
        
    end
    
end