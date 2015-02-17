function [ISI] = CalculateCVSingleNeuron(spikes)

%{
    This program will be used to calculate the CV from the interspike
    intervals for a single neuron.

    Max Henderson
    Drexel University
    4/14/14
%}

%% Calculate interspike interval.
spikes0 = [0; spikes];
spikes = [spikes; 0];
ISI = spikes - spikes0;
ISI = ISI(ISI>0);