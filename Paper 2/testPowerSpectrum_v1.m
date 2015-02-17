function [] = testPowerSpectrum_v1(f, T)

N = 200;
p = abs(fft(f))/(N/2);
p = p(1:N/2).^2;
freq = [0:N/2-1]/T;
semilogy(freq,p);
axis([0 200 0 1]);