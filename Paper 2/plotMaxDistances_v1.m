function dist = plotMaxDistances_v1(dir, numNeurons, simTime)

dist = zeros(21,1);
numCon = 5;
for i = 1:numCon,
    for str = 0:20,
        for j = 1:1,
            spikeCount = sprintf('%d', i);
            curStr = sprintf('%d', str);
            run = sprintf('%d', j);
            file_potentials = strcat(dir,'/spikeTrain', spikeCount, 'Strength', curStr, 'Run', run, '.txt')
            t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
            dist(str+1,1) = calculateMaxDistance(t, numNeurons, simTime) + dist(str+1,1);  
        end
    end
end
dist = dist/numCon;
plot(linspace(0,0.1,21),dist)