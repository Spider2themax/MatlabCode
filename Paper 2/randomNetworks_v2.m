function [] = randomNetworks_v2(dim, numNets, x, nameDir, numCon)

%{
    This program will generate the data necessary to test neural networks
    with random geometry.  Particularly, this code will generate
    simple cubic lattice cubes of neurons with a relative dimension
    specified by the user.  Then, four different connectivity schemes will
    be used to test network dynamics of the system.

    Max Henderson
    Drexel University
    Sept 30, 2013
%}

numNeurons = dim*dim*dim;
mkdir(nameDir)
tic
for i = 1:numNets,
    positions = createRandomNetwork(dim, x);
    nameDir1 = sprintf('%d',i);
    nameMake = sprintf('%s/%d/Random/%s', nameDir, numNeurons, nameDir1);
    mkdir(nameMake)
    cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
    n1 = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/Positions.txt',nameDir,numNeurons);          
    edit 'n1';          
    dlmwrite(n1, positions);
    %Determine dendrites using periodic boundary conditions.
    dendrites = calculateDendritesAnisotropic(numNeurons, positions, 10); 
    %First, random...
    for j = numCon,
        randomDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/%s/Random',nameDir,numNeurons, nameDir1);
        mkdir(randomDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        for k = 1:5,
            randomConnections_v1(positions, j, randomDir, k, dendrites)
        end
    end
    %Second, nearest neighbor connections...
    for j = numCon,
        nearestDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/%s/Nearest neighbors',nameDir,numNeurons, nameDir1);
        mkdir(nearestDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        nearestConnections_v1(positions, j, nearestDir, dendrites)
    end
    %Third, probabilistic nearest neighbors...
    for j = numCon,
        expDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/%s/Exponential neighbors',nameDir, numNeurons, nameDir1);
        mkdir(expDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        lowerBound = 5;
        for k = 1:5,
            lowerBound = exponentialConnections_v1(positions, j, expDir, k, lowerBound, dendrites);
        end
    end
end
toc