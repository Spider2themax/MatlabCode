function writeFirings(firings, dir, k,strength, run)

%% Write spike trains to file.
n1 = sprintf('%s/firings%sStrength%sRun%s.txt',dir, k, strength, run);            
edit 'n1';          
dlmwrite(n1, firings);