function [PM, idx, geo, dist] = AnalyzeAgedNetworks()

%k = {'0.2'; '0.1'; '0.05'; '0.03'; '0.02';'0.015'; '0.01'; '0.005'};

k = {'0.005'};

directory_name = '/data2/L/Brain/max/Paper2.5Data/';

PM = zeros(8,1);

for i = 1:length(k),
    
    a = k{i};
    
    curr = strcat(directory_name, 'K', a, '/')
    
    [pm1, pm2, idx, geo, dist] = LoadNeuralNetworks(curr, 100);
        
    PM(i,1) = pm1;
    PM(i,2) = pm2;
    
    PM
end