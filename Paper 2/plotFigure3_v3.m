function [] = plotFigure3_v3(results)

%{
    This program will plot, one by one, surface plots with colors
    representing the 'winning' connectivity algorithm.

    Max Henderson
    Drexel University
    October 1, 2013
%}

couplings = [0; 0.001; 0.002; 0.003; 0.004; 0.005; 0.006; 0.007; 0.008; 0.009; 0.010; 0.011; 0.012; 0.013; 0.014; 0.015; 0.016; 0.017; 0.018; 0.019; 0.02; 0.03; 0.04; 0.05; 0.1];
connections = [3;5;6;7;9];
data = zeros(25, 3);
a = 1;
b = 1;
c = 1;

hold on 
for i = 2:25,
    for j = 1:5,
        if results(i,j) == 1,
            plot(log10(couplings(i)), connections(j), 'sr', 'MarkerSize', 10)
            %data(a, 1) = log10(couplings(i));
            %data(a, 2) = connections(j);
        elseif results(i,j) == 2,
            plot(log10(couplings(i)), connections(j), 'sg', 'MarkerSize', 10)
        else
            plot(log10(couplings(i)), connections(j), 'sb', 'MarkerSize', 10)    
        end
    end
end