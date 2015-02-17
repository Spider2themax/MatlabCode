function [] = plotTotalFirings(spikes)

%{
    This function will plot the total number of spikes of a neural network
    over time.

    Max Henderson
    Feb 27, 2013
%}

spikes = sort(spikes);
totalSpikes = 0;
hold on
for i = 1:length(spikes),
    if spikes(i) > 0,
        totalSpikes =  totalSpikes + 1;
        plot(spikes(i), totalSpikes)
    end
end
xlabel('Time (ms)')
ylabel('Total number of spikes')
