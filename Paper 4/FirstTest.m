function [Dplot] = FirstTest(directory_name)

%% Load the files in the directory to get neural distributions.
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
fileCount = 0;

%% Go through each file and generate connectivity matrices.
for i = 1:length(fileIndex)
    
    fileName = files(fileIndex(i)).name;
    
    try
        if strcmp(fileName(1:17),'neuBlockwithColID'),
            
            % Iterate current file count... 
            fileCount = fileCount + 1
            
            % Load perturbed neurons with micrcolumnar ID...
            file_potentials = strcat(directory_name, '/', fileName); % --- file with neuron to reproduce
            data1 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
            data1 = reshape(data1, 4, length(data1)/4)';
            
            % Load perturbed neurons with micrcolumnar ID...
            file_potentials = strcat(directory_name, '/neuBlock_', fileName(19:27), '_000.xyz'); % --- file with neuron to reproduce
            data2 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
            data2 = reshape(data2, 3, length(data2)/3)';
            
            % Merge these two files to completely represent neural network
            % before and after perturbation...
            data = [data1 data2];
            data(:,2:7) = data(:,2:7)*0.698; %Scale back to MICRONS.
            %N = length(data);
            N = 10;
            data = data(1:N,:);
            
            % Now, determine drift of aged neurons.
            [D, Ddiff] = GetPeriodicDistances(data, N);
        end
    catch
       %Still scanning...
    end
end

disp('Finished!')
Dplot = zeros(N, 1);
count = 1;
for i = 1 : N,
    for j = 1 : N,
        if i ~= j,
            Dplot(count) = Ddiff(i,j);
            count = count + 1;
        end
    end
end
hist(Dplot)