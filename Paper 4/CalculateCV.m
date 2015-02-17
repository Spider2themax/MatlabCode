function [CV, ISI] = CalculateCV(spikes, N)

%{
    This program will be used to calculate the CV from the interspike
    intervals of all neurons.

    Max Henderson
    Drexel University
    4/14/14
%}

%% Calculate interspike intervals for neurons in network.
for i = 1 : N,
    if i == 1,
        ISI = CalculateCVSingleNeuron(spikes(i,:)');
    else
        isi = CalculateCVSingleNeuron(spikes(i,:)');
        ISI = [ISI; isi];
    end
end

%% Determine CV value.
S = std(ISI);
U = mean(ISI);
CV = S/U;