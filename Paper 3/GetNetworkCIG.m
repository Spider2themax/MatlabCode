function [data, needToRunAgain] = GetNetworkCIG(currentDir)

%{
    This function will determine the synchronicity within a random grid
    block in the neural network.

    Max Henderson
    7/22/14
    Drexel University
%}

%% Get SPIKE distances.
data = zeros(10, 6);

needToRunAgain = zeros(1,3);

simTime = 2000;

L = 300;

n = 12;

for fileIndex = 1:10,
    
    % Get network constants...
    file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt');        
    a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
    N = a(1);

        for age = 1:3,
            
            for con = 1:2,
            
                disp('Currently running connectivity matrix ...')
                fileIndex

                disp('and currently running age ...')
                age
                disp('_________________________________________________________________________')
                    
                [CIG, NCIG] = GetGridConn(currentDir, 1, fileIndex, con, age, L, n);
                                
                data(fileIndex, 2*(age-1) + con) = CIG/NCIG;

            end
            
        end
    
    data
    
end