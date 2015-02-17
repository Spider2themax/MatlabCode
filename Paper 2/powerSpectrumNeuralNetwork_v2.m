function [power, freq] = powerSpectrumNeuralNetwork_v2(spikes, simTime)

%{
    This function will display the power spectrum for the neural network.
    Hopefully, this will help provide us with some consistent results to
    determine what firing regime we are in; random, group, or synchronous.

    Max Henderson
    Feb 19, 2013
%}

%% Get firings per time unit.
keepSpikes = zeros(2,1);
count = 1;
for i = 1:length(spikes),
    if spikes(i) > 0,
        keepSpikes(count) = spikes(i);
        count = count + 1;
    end
end
length(keepSpikes)
firings = hist(keepSpikes,simTime);
Hs=spectrum.welch;
psd(Hs, firings, 'Fs', simTime)