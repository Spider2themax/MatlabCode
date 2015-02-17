function [] = crystalNetworks_v1(dim, numNets, nameDir)

%{
    This program will generate the data necessary to test neural networks
    with crystalline geometry.  Particularly, this code will generate
    simple cubic lattice cubes of neurons with a relative dimension
    specified by the user.  Then, four different connectivity schemes will
    be used to test network dynamics of the system.

    Max Henderson
    Drexel University
    Feb 28, 2013
%}

numNeurons = dim*dim*dim;
mkdir(nameDir)
numCon = 10;
tic
for i = 1:numNets,
    positions = createSCdim(dim);
    nameDir1 = sprintf('%d',i);
    nameMake = sprintf('%s/%d/Crystal/%s', nameDir, numNeurons, nameDir1);
    mkdir(nameMake)
    cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
    n1 = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/Positions.txt',nameDir,numNeurons);          
    edit 'n1';          
    dlmwrite(n1, positions);
    %Determine dendrites using periodic boundary conditions.
    dendrites = calculateDendrites(numNeurons, positions); 
    %First, random...
    for j = numCon,
        randomDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/%s/Random',nameDir,numNeurons, nameDir1);
        mkdir(randomDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        for k = 1:5,
            randomConnections_v1(positions, j, randomDir, k, dendrites)
        end
    end
    %Second, nearest neighbor connections...
    for j = numCon,
        nearestDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/%s/Nearest neighbors',nameDir,numNeurons, nameDir1);
        mkdir(nearestDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        nearestConnections_v1(positions, j, nearestDir, dendrites)
    end
    %Third, probabilistic nearest neighbors...
    for j = numCon,
        expDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/%s/Exponential neighbors',nameDir, numNeurons, nameDir1);
        mkdir(expDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        lowerBound = 5;
        for k = 1:5,
            lowerBound = exponentialConnections_v1(positions, j, expDir, k, lowerBound, dendrites);
        end
    end
    %Lastly, small world connections...
    for j = numCon,
        smallDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/%s/Small world',nameDir, numNeurons, nameDir1);
        mkdir(smallDir)
        cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
        for k = 1:5,
            p = (k*2-1)/10;
            smallWorldConnections_v1(positions, j, smallDir, p, dendrites)
        end
    end
end
toc