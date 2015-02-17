function [CV, CV1] = CVforNetwork(spikes, N)

%% Calculate individual CVs for each neuron and take average.
CV = zeros(N,1);
for i = 1:N,
    [CV(i), ISItemp] = CalculateCV(spikes(:,i));
    if i == 1,
        ISI = ISItemp;
    else
        ISI = [ISI; ISItemp];
    end
end
    
%% Calculate CV for the entire network.
S = std(ISI);
U = mean(ISI);
CV1 = S/U;