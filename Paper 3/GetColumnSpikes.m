function spikesTemp = GetColumnSpikes(spikes, ID, n)

idx = any(ID == n);
a = sum(idx);
[l w] = size(spikes);
spikesTemp = zeros(a, w);
count = 1;
for i = 1:length(ID),
    if ID(i) == n,
        
        if count == 1,
            spikesTemp = spikes(i,:);
        else
            spikesTemp = [spikesTemp; spikes(i,:)];
        end
        
        count = count + 1;
        
    end
end