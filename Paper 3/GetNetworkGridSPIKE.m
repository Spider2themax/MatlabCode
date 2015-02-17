ESnfunction [data, needToRunAgain] = GetNetworkGridSPIKE(currentDir, d_para, f_para, type)

%{
    This function will determine the synchronicity within a random grid
    block in the neural network.

    Max Henderson
    7/22/14
    Drexel University
%}

%% Get SPIKE distances.
stims = [5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100];
%stims = stims + 50;
data = zeros(25, length(stims), 6);

needToRunAgain = zeros(1,3);

simTime = 2000;

L = 240;

n = 10;

for fileIndex = 1:25,
    
    % Get network constants...
    file_potentials = strcat(currentDir,'networkConstants', int2str(fileIndex), '.txt');        
    a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
    N = a(1);

    for j = 1:length(stims),
        
        for age = [1, 3],
            
            for con = 1:2,
            
                disp('Currently running connectivity matrix ...')
                fileIndex
                disp('Currently running stimulus ...')
                stims(j)
                disp('and currently running age ...')
                age
                disp('_________________________________________________________________________')
                    
                [SPIKE, num] = GetGridSPIKE(currentDir, type, fileIndex, con, age, stims(j), simTime, L, n, 0, d_para, f_para);
                
                %numZero = sum(sum(SPIKE == 0));
                
                sumNum = sum(sum(num));
                
                SPIKE = SPIKE.*num/sumNum;  % Normalize for size of grid chunks
                
                data(fileIndex, j, 2*(age-1) + con) = sum(sum(SPIKE)); %/(n*n-numZero));

            end
            
        end
        
    end
    
    data
    
end