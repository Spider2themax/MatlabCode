function [] = connectionAndDistanceDistributions(connections1, dend1, connections2, dend2, connections3, dend3)

connectionDist1 = zeros(length(connections1),1);
connectionDist2 = zeros(length(connections2),1);
connectionDist3 = zeros(length(connections3),1);
distances1 = zeros(2,1);
distances2 = zeros(2,1);
distances3 = zeros(2,1);
count = 1;
for i = 1:length(connections1),
    connectionDist1(i,1) = sum(connections1(:,i)) + sum(connections1(i,:));
    for j = 1: length(connections1),
        if connections1(i,j) == 1,
            distances1(count) = dend1(i,j);
            count = count + 1;
        end
    end
end
count = 1;
for i = 1:length(connections2),
    connectionDist2(i,1) = sum(connections2(:,i)) + sum(connections2(i,:));
    for j = 1: length(connections2),
        if connections2(i,j) == 1,
            distances2(count) = dend2(i,j);
            count = count + 1;
        end
    end
end
count = 1;
for i = 1:length(connections3),
    connectionDist3(i,1) = sum(connections3(:,i)) + sum(connections3(i,:));
    for j = 1: length(connections3),
        if connections3(i,j) == 1,
            distances3(count) = dend3(i,j);
            count = count + 1;
        end
    end
end
hold on
subplot(2,3,1)
hist(connectionDist1,25)
title('Distance dependent connections')
ylabel('Connections per neuron')
xlabel('Number of connections')
subplot(2,3,2)
hist(connectionDist2,25)
title('Nearest neighbor connections')
ylabel('Connections per neuron')
xlabel('Number of connections')
subplot(2,3,3)
hist(connectionDist3,25)
title('Random connections')
ylabel('Connections per neuron')
xlabel('Number of connections')
subplot(2,3,4)
hist(distances1, 100)
ylabel('Distances per dendrite')
xlabel('Distance (microns)')
axis([0, max(distances1), 0, 50])
subplot(2,3,5)
hist(distances2, 100)
ylabel('Distances per dendrite')
xlabel('Distance (microns)')
axis([0, max(distances2), 0, 50])
subplot(2,3,6)
hist(distances3, 100)
ylabel('Distances per dendrite')
xlabel('Distance (microns)')
axis([0, max(distances3), 0, 50])
suptitle('Connectivity for 216 neurons with random neural placement')