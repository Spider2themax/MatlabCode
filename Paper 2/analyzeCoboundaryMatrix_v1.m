function a = analyzeCoboundaryMatrix_v1(A)

%{
    This program will be used to analyze the coboundary matrix of a certain
    connectivity matrix of a neural network.  By looking at the second
    eigenvalue of coboundary matrix, we determine the algebriac
    connectivity of the matrix, which should reveal how quickly the matrix
    would allow the neural network to achieve synchronous firing.

    Max Henderson
    Drexel University
    Oct 4, 2013
%}

% H will be used as the coboundary matrix.  It must be as large as the
% number of edges defined in A.
L = zeros(length(A));
for i = 1:length(A),
    for j = 1:length(A),
        if A(i,j) == 1,
            if L(i, j) ~= -1,
                L(i, i) = L(i, i) + 1;
                L(j, j) = L(j, j) + 1;
                L(i, j) = -1;
                L(j, i) = -1;
            end
        end
    end
end

% Determine coboundary matrix and the second smallest eigenvalue.
values = eig(L);
a = values(2);