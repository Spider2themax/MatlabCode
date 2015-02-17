function C = CreateConnectivityMatrix(Pos)

%{ 
    This program will build a distant dependent connectivity matrix as
    shown in Perin et al 2013 by using connectivity probabilities for total
    connectivity probability, reciprocal connectivity, and nonreciprocal
    connectivity using the intersomatic distances which can be calculated
    from neural positions Pos, assuming periodic boundary conditions.

    Max Henderson
    Drexel University
    Jan 27, 2014
%}

%% Step 1. Determine intersomatic distances and connection probabilities.
N = length(Pos);
D = zeros(N);
C1 = zeros(N);
C2 = zeros(N);
C3 = zeros(N);
for i = 1:N,
    for j = 1:N,
        D(i,j) = sqrt((Pos(i,1)-Pos(j,1))^2 + (Pos(i,2)-Pos(j,2))^2 + (Pos(i,3)-Pos(j,3))^2);
        if i ~= j,
            [c1, c2, c3] = ReturnConnectionProbabilities(D(i,j));
            C1(i,j) = c1;
            C2(i,j) = c2;
            C3(i,j) = c3;
        end
    end
end

