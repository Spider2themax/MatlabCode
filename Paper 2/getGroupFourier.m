function dist = getGroupFourier(dir, numNeurons, numCon)

simTime = 500;
dist = zeros(25,1);
strength = [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;30;40;50;100];
for i = 1:numCon,
    for str = 1:25,
        for j = 1:1,
            spikeCount = sprintf('%d', i);
            curStr = sprintf('%d', strength(str));
            run = sprintf('%d', j);
            try
                file_potentials = strcat(dir,'/spikeTrain', spikeCount, 'Strength', curStr, 'Run', run, '.txt')
                t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                dist(str) = dist(str) + PlotFourierGroup(GroupGofT_v0(t, numNeurons));
            catch
                disp('hmm looks like a bad run!')
            end
        end
    end
end
dist = dist/numCon;
plot(strength, dist)