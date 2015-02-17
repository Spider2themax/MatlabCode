function [] = ConnectNeurons_v1(directory_name, data, fileCount)

%{
    This program will be used to connect the neurons in our model using
    various methods which will be outlined later more specifically.

    Max Henderson
    January 1, 2014
    Drexel University
%}

%% Get intersomatic distance of all neural pairs.
N =  length(data);
D = zeros(N);
Ddiff = zeros(N,1);
for i = 1:N-1,
    for j = i+1:N
        % Get intersomatic distances of neurons in 'young' brain.
        D(i,j) = sqrt((data(i,2)-data(j,2))^2 + (data(i,3)-data(j,3))^2 +(data(i,4)-data(j,4))^2);
        D(j,i) = D(i,j);
    end
end
for i = 1:N,
    % Get intersomatic distances of neurons in 'young' brain.
    Ddiff(i) = sqrt((data(i,2)-data(i,5))^2 + (data(i,3)-data(i,6))^2 +(data(i,4)-data(i,7))^2);
end

%% Connect neurons based off of different connectivity methods.
young_chem1_con = DistanceDependent(D,N);
young_elec1_con = DistanceDependent(D,N);
old_chem1_con = zeros(N);
old_elec1_con = zeros(N);

for i = 1 : N,
    for j = 1 : N,
        
        if young_chem1_con(i,j) == 1,
            if rand(1,1) < 0.5,
                old_chem1_con(i,j) = 1;
            end
        end
        
        if young_elec1_con(i,j) == 1,
            if rand(1,1) < 0.5,
                old_elec1_con(i,j) = 1;
            end
        end
        
    end
end
        
%% Write out all data to be used in NEURON simulations.
n1 = sprintf('%s/young_chem1_con%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, young_chem1_con);

n1 = sprintf('%s/young_elec1_con%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, young_elec1_con);

n1 = sprintf('%s/old_chem1_con%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, old_chem1_con);

n1 = sprintf('%s/old_elec1_con%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, old_elec1_con);

n1 = sprintf('%s/data%d.txt',directory_name, fileCount);            
edit 'n1';          
dlmwrite(n1, data);