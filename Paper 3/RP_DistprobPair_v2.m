function [p] = RP_DistprobPair_v2(dist, gap)

%{
    This program will be used to connect neurons in a network based off of
    intersomatic distances of neurons in the network.

    Max Henderson
    February 19, 2014
    Drexel University
%}

%% Calculate connectivity based off exponential decaying function.
if gap == 1,
    x = 50; %Chemical decay constant
else
    x = 30;  %Electrical decay constant
end
p = 0.33*exp(-dist/x);

%% Readjust for diagonal.
for i = 1 : length(p),
   p(i,i) = 0; 
end