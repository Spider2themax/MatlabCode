function CV = GetCVnetwork(dir)

stims = [10; 15; 20; 25; 30; 35; 40; 45; 50];
for i = 1:numCon,
    for j = 1:length(stims),
        spikeCount = sprintf('%d', i);
        stimInterval = sprintf('%d', stims(j));
        run = sprintf('%d', j);
        file_potentials = strcat(dir,'/avgFiringRate', spikeCount, 'Strength', curStr, 'Run', run, '.txt')
        t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
        rates(str,1) = t + rates(str,1);  
    end
end