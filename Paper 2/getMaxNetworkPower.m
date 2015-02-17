function rates = getMaxNetworkPower(dir)

rates = zeros(11,1);
for i = 1:1,
    for str = 0:10,
        for j = 1:1,
            spikeCount = sprintf('%d', i);
            curStr = sprintf('%d', str);
            run = sprintf('%d', j);
            file_potentials = strcat(dir,'/spikeTrain', spikeCount, 'Strength', curStr, 'Run', run, '.txt')
            spikes = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
            power = powerSpectrumNeuralNetwork(spikes, 1000);
            max(power)
            rates(str+1,1) = max(power) + rates(str+1,1);  
        end
    end
end
rates = rates;
%% Plot firing rates over different realizations.
strengths = linspace(0,1,11);
plot(strengths, rates)
xlabel('g (siemens)')
ylabel('Max power')