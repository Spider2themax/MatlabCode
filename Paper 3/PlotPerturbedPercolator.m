function []  = PlotPerturbedPercolator()

hold on
P = linspace(0,1,1000);
for n = 1 : 10,
    for p = 1:1000,
        plot(P(p), GetNewP(P(p),n))
    end
end
axis([0 1 0 1])