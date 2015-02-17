function Conn = ConnectivityOfSingleNetwork(currentDir, fileIndex)

Conn = zeros(6,1);
for age = 1:6,
    [conn, N] = GetConnectivityData(currentDir, fileIndex, age);
    Conn(age) = sum(sum(conn))/N;
end