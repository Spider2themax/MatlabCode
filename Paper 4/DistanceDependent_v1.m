function [C, Dexp] = DistanceDependent_v1(D, N, gap)

%{
    This program will be used to connect neurons in a network based off of
    intersomatic distances of neurons in the network.

    Max Henderson
    February 19, 2014
    Drexel University
%}

%% Calculate connectivity based off exponential decaying function.
if gap == 1,
    x = 200; %Chemical decay constant
else
    x = 20;  %Electrical decay constant
end
Dexp = 0.33*exp(-D/x);
R = rand(N);
C = (Dexp > R);

%% Readjust for diagonal.
for i = 1 : N,
   C(i,i) = 0; 
end