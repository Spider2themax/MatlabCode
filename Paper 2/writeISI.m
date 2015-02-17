function [] = writeISI(s, dir, k, strength, run)

%{
    Determine interspike intervals (ISI) for spike trains for a system of 
    neurons.

%}

%% Calculate ISI.
[l w] = size(s);
numSpikes = sum(any(s));
ISI = zeros(numSpikes, 1);
count = 1;
for i = 1:w,
    for j = 1:l-1,
        newISI = s(j+1,i) - s(j,i);
        if newISI > 0,
            ISI(count) = newISI;
            count = count + 1;
        end
    end
end

%% Write ISI to file.
k
n1 = sprintf('%s/ISI%sStrength%sRun%s.txt',dir, k, strength, run);
edit 'n1';          
dlmwrite(n1, ISI);