function [COM, density] = centerOfMass(positions)

%{ 
    This program will calculate the center of mass, COM, from the 3D 
    spatial distribution of the neurons in positions.  Assume that all 
    neurons have identical mass.

    Max Henderson
    Drexel University
    12/6/12
%}

%% Calculate COM.
COM = zeros(1,3);
M = length(positions);
COM(1,1) = sum(positions(:,1))/M;
COM(1,2) = sum(positions(:,2))/M;
COM(1,3) = sum(positions(:,3))/M;

%% Also return the density of the system.
minX = min(positions(:,1));
minY = min(positions(:,2));
minZ = min(positions(:,3));
maxX = max(positions(:,1));
maxY = max(positions(:,2));
maxZ = max(positions(:,3));
volume = (maxX-minX)*(maxY-minY)*(maxZ-minZ);
density = length(positions)/volume;
