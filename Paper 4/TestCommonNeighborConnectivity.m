function [conn2] = TestCommonNeighborConnectivity(N, Dens)

%{
    This program will test the common neighbor law.

    Max Henderson
    January 6, 2014
    Drexel University
%}

%{
C = zeros(N);
for i = 1:N,
    for j = 1:N,
        if i ~= j,
            if rand(1,1) < 0.1,
                C(i,j) = 1;
            end
        end
    end
end
%}

[conn, p, pr, pnr] = GetConnectivity(N, Dens);

iter = 40;

conn2 = Reorganize (conn, iter, 1, 1, p, pr, pnr);

NC = 21.54 - (3.9/10000)*Dens + (6.42/100)*N
CS = 13.23 + (Dens/10000)*exp(-(log(N/(1300 + 3*Dens/1000)))^2)