function [power, freq] = powerSpectrumNeuralNetworkMFP(mfp, simTime)

%{
    This function will display the power spectrum for the neural network.
    Hopefully, this will help provide us with some consistent results to
    determine what firing regime we are in; random, group, or synchronous.

    Max Henderson
    March 21, 2013
%}
mfp = simplifyMFP(mfp, simTime);
averageMFP = mean(mfp);
mfp = mfp - averageMFP;
Y = fft(mfp)/simTime;
N = length(Y); Y(1) = [];
power = abs(Y(1:N/2)).^2;
freq = (1:N/2)/N*simTime;
%{
hold on
subplot(2,1,1)
plot(linspace(0,simTime, length(mfp)), mfp)
subplot(2,1,2)
plot(freq, power)
xlabel('Frequency (Hz)'); ylabel('Power')
%}