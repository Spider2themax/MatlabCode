function MFP = meanFieldPotential(spikes)

%{
    This function will determine the average voltage field across the 
    neural network as a function of time.
%}

[l w] = size(spikes);
MFP = zeros(l, 1);
for i = 1:l,
    MFP(i) = mean(spikes(i,1:w-1));
end
%plot(spikes(:,w), MFP)
%xlabel('Time (ms)')
%ylabel('MFP')
MFP = mean(MFP);