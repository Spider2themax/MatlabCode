function [] = PlotNetwork(directory_name)

%{
    This program will plot the neural network showing the 3D distribution
    of neurons.

    Max Henderson
    March 5, 2014
    Drexel University
%}

%% Load the files in the directory to get neural distributions.
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
fileCount = 0;
tic

%% Go through each file and generate connectivity matrices.
for i = 1:length(fileIndex)
    
    fileName = files(fileIndex(i)).name;
    
    try
        if strcmp(fileName(1:17),'neuBlockwithColID'),
            
            % Load perturbed neurons with micrcolumnar ID...
            file_potentials = strcat(directory_name, '/', fileName); % --- file with neuron to reproduce
            data1 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
            data1 = reshape(data1, 4, length(data1)/4)';
            
        else
            
            % Keep searching...
        end
    end
end

plot3(data1(:,2), data1(:,3), data1(:,4), 's')
