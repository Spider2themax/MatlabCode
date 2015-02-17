function [c2] = ReturnConnectionProbabilities(D)

%{ 
    This program will determine intersomatic distance D and
    return 3 connection probabilities based off of sigmoidal functions
    fitting connection probabilities gathered from experimental data.

    c1 - Connection probability
    c2 - Reciprocal probability
    c3 - Non-reciprocal probability

    Max Henderson
    Drexel University
    Jan 27, 2014
%}

x = linspace(0,1,301);

% Reciprocal probability...
c2 = zeros(301);
scaling = -(1)/(1+1);
scaling = scaling/0.2;
for i = 1:301,
    c2(i) = 0.25+(x(i))/(1+abs(x(i)))/scaling;
end
x = linspace(0,301,301);
plot(x,c2)
