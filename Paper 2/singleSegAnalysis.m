function [] = singleSegAnalysis(spikes)

data = zeros(2,1);
count = 1;
for i = 1:length(spikes),
    if spikes(i) > 0,
        count = count + 1;
        data(count) = spikes(i);
    end
end

for i = 1:500,
    a = hist(data, i);
    if rem(i,50) == 0,
        hist(data, i)
        pause(2)
    end
end