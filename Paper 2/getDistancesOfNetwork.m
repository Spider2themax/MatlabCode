function avgDist = getDistancesOfNetwork(dir,numNeurons,numCon)

miss = 0;
distances = zeros(2,1);
count = 1;
for con = 1:numCon,
    spikeCount = sprintf('%d', con);
    try
        file_potentials = strcat(dir,'/Connections', spikeCount, '.txt');
        Con = load( file_potentials);
        file_potentials = strcat(dir,'/Dendrites.txt');
        Dend = load( file_potentials);
        for i = 1:length(Con),
            for j = 1: length(Con),
                if Con(i,j) == 1,
                    distances(count) = Dend(i,j);
                    count = count + 1;
                end
            end
        end
    catch
        miss = miss + 1;
    end
end
miss
avgDist = mean(distances);