function [Conn, means, stds] = ConnectivityOfNetwork(currentDir)

%% Get number of connections as a function of age and elec/chem.
maxFileIndex = 10;
Conn = zeros(6,maxFileIndex);
for fileIndex = 1:maxFileIndex,
    conn = ConnectivityOfSingleNetwork(currentDir, fileIndex);
    Conn(:,fileIndex) = conn;
end

%% Get average results and stdev.
Conn  = Conn';
means = mean(Conn);
stds  = std(Conn);
