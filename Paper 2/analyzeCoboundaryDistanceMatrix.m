function a = analyzeCoboundaryDistanceMatrix(A, D)

%{
    This program will be used to analyze the coboundary matrix of a certain
    connectivity matrix of a neural network.  By looking at the second
    eigenvalue of coboundary matrix, we determine the algebriac
    connectivity of the matrix, which should reveal how quickly the matrix
    would allow the neural network to achieve synchronous firing.  This
    program also focuses on incorporating in the distances of the
    connections between neurons that are connected.  This distance
    information is contained in matrix D.

    Max Henderson
    Drexel University
    March 21, 2013
%}

% H will be used as the coboundary matrix.  It must be as large as the
% number of edges defined in A.
H = zeros(sum(sum(A)));
count = 1;
for i = 1:length(A),
    for j = 1:length(A),
        if A(i,j) == 1,
            H(count, i) = D(i,j);
            H(count, j) = -D(i,j);
            count = count + 1;
        end
    end
end

% Determine coboundary matrix and the second smallest eigenvalue.
L = H'*H;
L = L(1:length(A),1:length(A));
values = eig(L);
a = values(2)