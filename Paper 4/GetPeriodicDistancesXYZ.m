function [D] = GetPeriodicDistancesXYZ(data, N, xyz)

D = CalculatePeriodicDistances(N, data(:,2:4), xyz); %For distances between young neurons
