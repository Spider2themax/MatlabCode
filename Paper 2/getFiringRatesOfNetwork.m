function rates = getFiringRatesOfNetwork(dir,numNeurons,numCon)

rates = zeros(25,1);
strength = [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;30;40;50;100];
miss = 0;
for i = 1:numCon,
    for str = 1:25,
        for j = 1:1,
            spikeCount = sprintf('%d', i);
            curStr = sprintf('%d', strength(str));
            run = sprintf('%d', j);
            try
                file_potentials = strcat(dir,'/avgFiringRate', spikeCount, 'Strength', curStr, 'Run', run, '.txt')
                t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                rates(str,1) = t + rates(str,1);  
            catch
                miss = miss + 1;
            end
        end
    end
end
rates = rates/(numCon*numNeurons);
miss