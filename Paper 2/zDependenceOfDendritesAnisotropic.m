function [] = zDependenceOfDendritesAnisotropic(numNeurons, pos)

num = 100;
diff = zeros(num + 1,1);
for Z = 0:num,
    [d1, d2] = calculateDendritesAnisotropic(numNeurons, pos, Z);
    diff(Z+1) = sum(sum(d2 - d1));
end
Z = linspace(0, num, num+1);
plot(Z, diff)