function data = plotMeanAndSpikeDistances(dir, numNeurons, numCon, d_para, f_para)

simTime = 500;
data = zeros(25,2);
strength = [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;30;40;50;100];
for i = 1:numCon,
    for str = 1:25,
        for j = 1:1,
            spikeCount = sprintf('%d', i);
            curStr = sprintf('%d', strength(str));
            run = sprintf('%d', j);
            file_potentials = strcat(dir,'/spikeTrain', spikeCount, 'Strength', curStr, 'Run', run, '.txt')
            t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
            results=f_distances_MEX(t,d_para,f_para, numNeurons);
            [muhat,sigmahat] = plotIndSPIKEDist(results.distance_matrices, numNeurons);
            data(str, 1) = data(str, 1) + muhat;
            data(str, 2) = data(str, 2) + sigmahat;
        end
    end
end
data = data/numCon;