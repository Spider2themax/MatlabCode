function algCon = getAlgDistOfNetwork(dir,numNeurons,numCon)

miss = 0;
distances = zeros(2,1);
count = 1;
algCon = 0;
for con = 1:numCon,
    spikeCount = sprintf('%d', con);
    try
        file_potentials = strcat(dir,'/Connections', spikeCount, '.txt');
        Con = load( file_potentials);
        file_potentials = strcat(dir,'/Dendrites.txt');
        Dend = load( file_potentials);
        algCon = algCon + analyzeCoboundaryMatrix(Con);
    catch
        miss = miss + 1;
    end
end
miss
algCon = algCon/(numCon-miss);