function keeps = GetCriticalL(micros, L)

%{
    This program will be used to determine the length of the box we desire
    to create a microcolumnar system that will have on average, a 1-to-1
    correspondance with number of node points and number of microcolumns.
    
    So basically, what L would we use to create a system with 4, 9, 16, 25,
    etc microcolumns?  

    INPUT

    micros : data of number of microcolumns for various L
    L : lengths of the boxes used to contain neurons

    OUTPUT

    keeps : this stores the critical L that correspond to particular
    numbers of microcolumns

    Max Henderson
    October 4, 2014
    Drexel University
%}

%% Set up parameters.
numToKeep = 20; % The square root of the number of nodes we want, maximally
curSquare = 2; % Initial condition; smallest system (2 by 2 grid)
keeps = zeros(numToKeep,2);

%% Get average microcolumns per L.
micros = mean(micros,2);

%% Get critical micros.
for i = 1 : length(micros),
    if micros(i) >= curSquare^2,
        keeps(curSquare-1,1) = L(i); % Save critical L
        keeps(curSquare-1,2) = micros(i); % Save critical corresponding microcolumnar count
        curSquare = curSquare + 1;
    end
end