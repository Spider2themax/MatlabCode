function S = testFit(d, a)

couplings = linspace(0,0.1, 10000);
S = zeros(length(couplings),1);
x1 = 100;
for i = 1:length(couplings),
    x1 = d/1000;
    x2 = 0.14;
    E = -(x1 - couplings(i)*100)^2;
    if E < x1,
        x1 = couplings(i);
    end
    S(i) = exp(E)/8 + x2;
end
plot(couplings, S, 's')