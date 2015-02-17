function pos = randMove(randX, L, x)

%{ 
    This program will adjust the position of a neuron in a certain
    dimension (x,y, or z) that accounts for the size of the system.

    Max Henderson
    Drexel University
    12/12/12
%}

if (x + randX) < 0,
    randX = randX + x;
    pos = L + randX;
elseif (x + randX) > L,
    randX = x + randX - L;
    pos = randX;
else
    pos = x + randX;
end