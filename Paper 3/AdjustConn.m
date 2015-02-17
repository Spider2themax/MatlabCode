function C = AdjustConn(C, N, inhibIndex)

temp = zeros(N);
temp(inhibIndex:N, inhibIndex:N) = C;
C = temp;