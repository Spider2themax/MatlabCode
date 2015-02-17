function [FR] = TestFR_rates()

FR = zeros(20,4);

for i = 1:20,
    
    name = strcat('/data2/L/Brain/max/Paper2.5Data/testStrengths/spikes1_1_1_31_', int2str(i), '.0.txt');
    
    [spikes] = GetSpikeTrain(name, 616);
    
    FR(i,1) = length(spikes/2);
    
    name = strcat('/data2/L/Brain/max/Paper2.5Data/testStrengths/spikes2_1_1_31_', int2str(i), '.0.txt');
    
    [spikes] = GetSpikeTrain(name, 616);
    
    FR(i,2) = length(spikes/2);
    
    name = strcat('/data2/L/Brain/max/Paper2.5Data/testStrengths/spikes1_3_1_31_', int2str(i), '.0.txt');
    
    [spikes] = GetSpikeTrain(name, 616);
    
    FR(i,3) = length(spikes/2);
    
    name = strcat('/data2/L/Brain/max/Paper2.5Data/testStrengths/spikes2_3_1_31_', int2str(i), '.0.txt');
    
    [spikes] = GetSpikeTrain(name, 616);
    
    FR(i,4) = length(spikes/2);
    
end