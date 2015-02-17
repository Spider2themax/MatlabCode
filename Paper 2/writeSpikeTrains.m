function writeSpikeTrains(s, dir, k,strength, run)

%% Write spike trains to file.
[l w] = size(s);
data = reshape(s,l*w,1);
n1 = sprintf('%s/spikeTrain%sStrength%sRun%s.txt',dir, k, strength, run);            
edit 'n1';          
dlmwrite(n1, data);
