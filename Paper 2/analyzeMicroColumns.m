function [] = analyzeMicroColumns(micros, nameDir)

%Determine dendrites using periodic boundary conditions.
microsPos = zeros(1,3);
count = 1;
for i = 1:length(micros),
   if micros(i,1) > 0 &&  micros(i,2) > 0 && micros(i,3) > 0 && micros(i,1) < 200 && micros(i,2) < 200 && micros(i,3) < 200,
      microsPos(count,:) = micros(i,:);
      count = count + 1;
   end
end
numNeurons = length(microsPos);
dendrites = calculateDendrites_micro(numNeurons, microsPos); 
%First, random...
for j = 5,
        
    randomDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/%s/Random',nameDir,numNeurons, '1');
    
    mkdir(randomDir)
    
    cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
    
    for k = 1:5,
    
        randomConnections_v1(microsPos, j, randomDir, k, dendrites)
        
    end
    
end

%Second, nearest neighbor connections...

for j = 5,

    nearestDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/%s/Nearest neighbors',nameDir,numNeurons, '1');
    
    mkdir(nearestDir)
    
    cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
    
    nearestConnections_v1(microsPos, j, nearestDir, dendrites)
    
end

%Third, probabilistic nearest neighbors...

for j = 5,

    expDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/%s/Exponential neighbors',nameDir, numNeurons, '1');
    
    mkdir(expDir)
    
    cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
    
    lowerBound = 5;
    
    for k = 1:5,
    
        lowerBound = exponentialConnections_v1(microsPos, j, expDir, k, lowerBound, dendrites);
        
    end
    
end

%Lastly, small world connections...

for j = 5,

    smallDir = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/%d/Random/%s/Small world',nameDir, numNeurons, '1');
    
    mkdir(smallDir)
    
    cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
    
    for k = 1:5,
    
        p = (k*2-1)/10;
        
        smallWorldConnections_v1(microsPos, j, smallDir, p, dendrites)
        
    end
    
    
end