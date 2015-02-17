function [C] = DistanceDependent(D,N)

%{
    This program will be used to connect neurons in a network based off of
    connectivity profiles shown in Perin et al 2011 and restated in Perin
    et al 2013.  The produced connectivity matrix will also be used as an
    initial primer matrix for the common neighbor law algorithm.

    Max Henderson
    December 28, 2013
    Drexel University
%}

[C1coeff, c1] = CheckFunctionFitting_v1(1, 0);  % For total connections
[C2coeff, c2] = CheckFunctionFitting_v1(1, 0);  % For reciprocal connections
[C3coeff, c3] = CheckFunctionFitting_v1(1, 0);  % For nonreciprocal connections

C1 = c1(C1coeff, D);
C2 = c2(C2coeff, D);
C3 = c3(C3coeff, D);
CR = rand(N);

% Determine connections based off C1, C2, C3, and CR.
C = zeros(N);
for i = 1:N-1,
    for j = i + 1:N,
        if CR(i,j) < C2(i,j),
            C(i,j) = 1;
            C(j,i) = 1;
        elseif ((CR(i,j) >= C2(i,j)) && (CR(i,j) < C2(i,j) + C3(i,j)/2)),
            C(i,j) = 1;
        elseif ((CR(i,j) >= C2(i,j) + C3(i,j)/2) && (CR(i,j) < C2(i,j) + C3(i,j))),
            C(j,i) = 1;
        else
            % No connections 
        end
    end
end