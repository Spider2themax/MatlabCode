function num_spikes = getNumSpikes(spikes)

num_spikes = 0;
for i = 1:64,
    for j = 1:64
        if spikes(i,j) > 0 ,
            num_spikes =  num_spikes + 1;
        end
    end
end