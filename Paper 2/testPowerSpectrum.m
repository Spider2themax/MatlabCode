function [] = testPowerSpectrum()

N = 10000;
T = 3.4;
t = [0:N-1]/N;
t = t*T;
f = sin(2*pi*10*t);
p = abs(fft(f))/(N/2);
p = p(1:N/2).^2;
freq = [0:N/2-1]/T;
semilogy(freq,p);
axis([0 20 0 1]);