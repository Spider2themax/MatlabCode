function [] = writeAvgFiringRate(avgFiringRate, dir, k, strength, run)

%{
    Writes average firing rate to file.
%}

%% Write MFP to file.
n1 = sprintf('%s/avgFiringRate%sStrength%sRun%s.txt',dir, k, strength, run);            
edit 'n1';          
dlmwrite(n1, avgFiringRate);