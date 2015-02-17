function [t] = GetConn(dir, fileIndex, con, age)

%{
    This function will get a connectivity matrix according to age and conn
    types.

    Max Henderson
    7/31/14
    Drexel University
%}


%% Read in the connections.
file_potentials = strcat(dir,'C', int2str(con), '_', int2str(age), '_', int2str(fileIndex), '.txt')
t = load(file_potentials);