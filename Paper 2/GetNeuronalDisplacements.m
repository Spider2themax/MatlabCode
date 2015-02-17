function deltaR = GetNeuronalDisplacements(n1, n2)

deltaR = zeros(length(n1),1);

for i = 1:length(n1),
    deltaR(i) = ((n1(i,1)-n2(i,1))^2 + (n1(i,1)-n2(i,1))^2 + (n1(i,1)-n2(i,1))^2)^0.5;
end