function bins = binSpikeTimes(s, simTime, N)

bins = zeros(simTime, N);
spikes = reshape(s, N, N);
for i = 1 : N,
    for j = 1 : N,
        if spikes(i,j) > 0,
            bins(floor(spikes(i,j)), j) = bins(floor(spikes(i,j)), j) + 1;
        end
    end
end