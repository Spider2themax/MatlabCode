function [p] = PlotFourierGroup(signal)

simTime = 500;
Y = fft(signal)/simTime;
N = length(Y); Y(1) = [];
power = abs(Y(1:N/2)).^2;
freq = (1:N/2)/N*simTime;

%{
hold on
subplot(2,1,1)
plot(linspace(0,simTime, length(signal)), signal)

subplot(2,1,2)
plot(freq, power)
xlabel('Frequency (Hz)'); ylabel('Power')
%}

p = max(power);