function [] = analyzeNetworks_v1(dim, numNets, nameDir)

%{

    Max Henderson
    Drexel University
    April 22, 2013
%}

numNeurons = dim*dim*dim;
mkdir(nameDir)
numCon = 10;
tic
for i = 1:numNets,
    nameDir1 = sprintf('%d',i);
    n1 = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/Positions.txt',nameDir,numNeurons);          
    for j = numCon,
        randomDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/%s/Random',nameDir,numNeurons, nameDir1);
        for k = 1:5,
            getSingleNetworkData_v1(randomDir, numNeurons, 5)
        end
    end
    %Second, nearest neighbor connections...
    for j = numCon,
        nearestDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/%s/Nearest neighbors',nameDir,numNeurons, nameDir1);
        getSingleNetworkData_v1(nearestDir, numNeurons, 1)
    end
    %Third, probabilistic nearest neighbors...
    for j = numCon,
        expDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Crystal/%s/Exponential neighbors',nameDir, numNeurons, nameDir1);
        for k = 1:5,
            getSingleNetworkData_v1(expDir, numNeurons, 5)
        end
    end
end
toc