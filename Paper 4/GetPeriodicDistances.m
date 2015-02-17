function [D, Ddiff] = GetPeriodicDistances(data, N, directory_name, fileCount)

D = CalculatePeriodicDistances(N, data(:,2:4)); %For distances between young neurons
Ddiff = CalculatePeriodicDistancesAged(N, D, data(:, 5:7), directory_name, fileCount);