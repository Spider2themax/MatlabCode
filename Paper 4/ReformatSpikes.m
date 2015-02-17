function s = ReformatSpikes(spikes, N)

spikeCount = ones(N,1);
s = zeros(N);
for i = 1:length(spikes)/2,
   s(spikeCount(spikes(i*2 - 1)), spikes(i*2 - 1)) = spikes(i*2);
     
   spikeCount(spikes(i*2 - 1)) =  spikeCount(spikes(i*2 - 1)) + 1;
    
end