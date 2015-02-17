function [power, freq] = powerSpectrumNeuralNetwork(spikes, simTime)

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
firings = hist(keepSpikes,simTime);
subplot(2,1,1)
plot(linspace(0,simTime, simTime), firings)
Y = fft(firings)/simTime;
N = length(Y); Y(1) = [];
power = abs(Y(1:N/2)).^2;
freq = (1:N/2)/N*simTime;
subplot(2,1,2)
plot(freq, power)
xlabel('Frequency (Hz)'); ylabel('Power')