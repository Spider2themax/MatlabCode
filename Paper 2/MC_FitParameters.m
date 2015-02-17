function [xsave, Esave] = MC_FitParameters(S)

iterations = 1000000;
b = 100;
x = [0.1, 100, 8, 0.14, 0.005];
count = 1;
allE = zeros(iterations ,1);
Emin = testFitParameters(x(1), x(2), x(3), x(4), x(5), S);
allE(1) = Emin;
Efirst = Emin;
Esave = 100000000;
xsave = 0;
while count < iterations,
    pick = ceil(5*rand(1,1));
    xsave = x;
    x(pick) = x(pick)+x(pick)*(rand(1,1) - rand(1,1))/100;
    E = testFitParameters(x(1), x(2), x(3), x(4), x(5), S);
    if abs(E) < abs(Emin),
        % x accepts the change.
        Emin = E;
    else
        prob = exp(-(E-Emin)*b);
        if rand(1,1) < prob,
            % save x           
            Emin = E;
        else
            % discard
            x = xsave;
        end
    end
    count = count + 1;
    allE(count) = Emin;
    if Emin < Esave,
        xsave = x;
        Esave = Emin;
    end
end
hold on
subplot(2,1,1)
plotFit(xsave(1), xsave(2), xsave(3), xsave(4), xsave(5), S)
subplot(2,1,2)
plot(linspace(1,iterations, iterations), allE)