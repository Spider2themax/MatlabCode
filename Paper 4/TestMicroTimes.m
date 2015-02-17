function [times, N] = TestMicroTimes(directory_name)

T = 25;
times = zeros(T,1);
N = zeros(T,1);
for i = 1 : T,
    [t, n] = LoadNeuralNetworks(directory_name, i);
    times(i) = t;
    N(i) = n;
end
 
plot(N, times)