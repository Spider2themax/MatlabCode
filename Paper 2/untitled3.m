function S = buildFucntion(d, a, couplings)

S = zeros(length(couplings),1);
for i = 1:length(couplings),
    E = -abs(d - couplings(i);
    
    S(i) = 