function [positions, COM, density] = createRandomNetwork(dim, x)

%{ 
    This program will create a matrix of 3D points according to a random 
    distribution of neurons formed from moving neurons randomly from an 
    initial simple cubic crysalline lattice.

    Max Henderson
    Drexel University
    12/12/12
%}

%% Create positions of originally crystalline network.
[positions, COM, density] = createSCdim(dim);
L = max(positions(:,1));

%% Randomly move each neuron x times assuming periodic BC.
neurons = dim*dim*dim;
for i = 1:neurons,
    for j = 1:x,
        randX = (1-rand(1,1))*L; 
        randY = (1-rand(1,1))*L; 
        randZ = (1-rand(1,1))*L;
        positions(i,1) = randMove(randX, L, positions(i,1));
        positions(i,2) = randMove(randY, L, positions(i,2));
        positions(i,3) = randMove(randZ, L, positions(i,3));
    end
end