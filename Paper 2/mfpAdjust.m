function rates = mfpAdjust(dir)

numCon = 10;
rates = zeros(8,4);
strength = [10; 20; 50; 100];
for i = 3:numCon,
    for str = 1:4,
        for j = 1:1,
            spikeCount = sprintf('%d', i);
            curStr = sprintf('%d', strength(str));
            run = sprintf('%d', j);
            file_potentials = strcat(dir,'/MFP', spikeCount, 'Strength', curStr, 'Run', run, '.txt')
            mfp = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
            %file_potentials = strcat(dir,'/firings', spikeCount, 'Strength', curStr, 'Run', run, '.txt')
            rates(i-2,str) = mfpSpikes(mfp,0) + rates(i-2,str);  
        end
    end
end
rates = rates/numCon;
%% Plot firing rates over different realizations.
strengths = linspace(3,10,8);
plot(strengths, rates(4:11))
xlabel('g (siemens)')
ylabel('Max power')