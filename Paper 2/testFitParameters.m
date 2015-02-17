function ChiSquared = testFitParameters(x1, x2, x3, x4, x5, S)

couplings = [0,0.00100000000000000,0.00200000000000000,0.00300000000000000,0.00400000000000000,0.00500000000000000,0.00600000000000000,0.00700000000000000,0.00800000000000000,0.00900000000000000,0.0100000000000000,0.0110000000000000,0.0120000000000000,0.0130000000000000,0.0140000000000000,0.0150000000000000,0.0160000000000000,0.0170000000000000,0.0180000000000000,0.0190000000000000,0.0200000000000000,0.0300000000000000,0.0400000000000000,0.0500000000000000,0.100000000000000];
ChiSquared = 0;
for i = 1:length(couplings),
    E = -(x1 - couplings(i)*x2)^2;
    s1 = exp(-x5/couplings(i))*exp(E)/x3 + x4;
    chi = (S(i) - s1)^2/s1;
    if chi < 0,
        disp('gotta problem')
    end
    ChiSquared = ChiSquared + chi;
end