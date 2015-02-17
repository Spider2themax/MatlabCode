function MFP = writeMFP(spikes,dir,k,strength, run)

%{
    This function will determine the average voltage field across the 
    neural network as a function of time.
%}

%% Calculate MFP.
[l w] = size(spikes);
MFP = zeros(l, 1);
for i = 1:l,
    MFP(i) = mean(spikes(i,1:w-1));
end

%% Write MFP to file.
n1 = sprintf('%s/MFP%sStrength%sRun%s.txt',dir, k,strength, run);            
edit 'n1';          
dlmwrite(n1, MFP);