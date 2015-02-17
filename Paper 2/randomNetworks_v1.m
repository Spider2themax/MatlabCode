function [] = randomNetworks_v1(dim, numNets, x, nameDir)

numNeurons = dim*dim*dim;
mkdir(nameDir)
tic
for i = 1:numNets,
    %Get positions and dendrites.
    positions = createRandomNetwork(dim, x);
    cd(nameDir)
    nameDir1 = sprintf('%d',i);
    mkdir(nameDir1)
    cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
    n1 = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/Positions.txt',nameDir,numNeurons);            
    edit 'n1';          
    dlmwrite(n1, positions);
    dendrites = calculateDendrites(numNeurons, positions); 
    %Make all the different connectivity schemes.
    randomDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random',nameDir,numNeurons);
    mkdir(randomDir)
    %First, random...
    for j = 5,
        randomDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/%d',nameDir,numNeurons, j);
        mkdir(randomDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        for k = 1:5,
            randomConnections_v1(positions, j, randomDir, k, dendrites)
        end
    end
    %Second, nearest neighbor connections...
    for j = 5,
        nearestDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Nearest neighbors/%d',nameDir,numNeurons, j);
        mkdir(nearestDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Neural research/')
        nearestConnections_v1(positions, j, nearestDir, dendrites)
    end
    %Third, probabilistic nearest neighbors...
    for j = 5,
        expDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Exponential neighbors/%d',nameDir, numNeurons, j);
        mkdir(expDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        lowerBound = 5;
        for k = 1:5,
            lowerBound = exponentialConnections_v1(positions, j, expDir, k, lowerBound, dendrites);
        end
    end
    %Lastly, small world connections...
    for j = 5,
        smallDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%s/Small world/%d',nameDir, numNeurons, j);
        mkdir(smallDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        for k = 1:5,
            p = (k*2-1)/10;
            smallWorldConnections_v1(positions, j, smallDir, p, dendrites)
        end
    end
end
toc