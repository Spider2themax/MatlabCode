function [positions, COM, density] = createSCdim(dim)

%{ 
    This program will create a matrix of 3D points according to a simple
    cubic crystalline lattice.

    Max Henderson
    Drexel University
    12/6/12
%}


%% Create fully populated network with simple cubic lattice geometry.
neurons = dim*dim*dim;
positions = zeros(neurons, 3);
count = 1;
a = (neurons*(484^3)/7000)^(1/3)
for x = 1:dim,
    for y = 1:dim,
        for z = 1:dim,
            positions(count, 1) = (x-0.5)*a/dim;
            positions(count, 2) = (y-0.5)*a/dim;
            positions(count, 3) = (z-0.5)*a/dim;
            count = count + 1;
        end
    end
end

%% Calculate the center of mass (origin) of the positions and the density.
[COM, density] = centerOfMass(positions);

%% Plot the positions of the final neuronal distribution.
%plot3(positions(:,1), positions(:,2), positions(:,3), 's')