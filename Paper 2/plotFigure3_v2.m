function minimums = plotFigure3_v2(results)

%{
    This program will plot the 'winner', aka the connectivity that leads to
    the lowest SPIKE-distances for a particular network size and geometry.
    The classifaction will be as follows:

    Nearest neighbor     = 1st column
    Exponential neighbor = 2nd column
    Random neighbor      = 3rd column

    Max Henderson
    Drexel University
    October 1, 2013
%}

minimums = zeros(25,1);
for i = 1:25,
    [C,I] = min(results(i,:));
    minimums(i) = I;
end