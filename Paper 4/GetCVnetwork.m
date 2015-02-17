function data = GetCVnetwork(currentDir)

%% Get CV regularity measurements.
stims = [10; 15; 20; 25; 30; 35; 40; 45; 50];
data = zeros(10, length(stims), 6);
for i = 1:10,
    file_potentials = strcat(currentDir,'networkConstants', int2str(i), '.txt');        
    a = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
    N = a(1);
    for j = 1:length(stims),
        for age = 1:6,
            disp('Currently running connectivity matrix ...')
            i
            disp('Currently running stimulus ...')
            j
            disp('and currently running age ...')
            age
            try
                [spikes] = GetSimulationData(currentDir, N, i, stims(j), 0, age, 1000);
                [CV, ISI] = CalculateCV(spikes, N);
                data(i, j, age) = CV;
            catch
                disp('messed up file')
            end
        end
    end
end