function [micros, L] = TestGeneralMicroNumbersAsBoxSize()

%{
    FINISH EDDITNG

    Max Henderson
    May 28, 2014
    Drexel University
%}

%% Load the files in the directory to get neural distributions.
L = linspace(10,1000, 100); % Lengths to experiment over
micros = zeros(25,length(L)); % Will be used to determine the number of microcolumns in a particular volume of L^3
directory_name = '/data2/L/Brain/max/Paper2.5Data/ConvergenceTest/';
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
fileCount = 0;

%% Determine the average number of microcolumns as a function of box size.
for f = 1:length(fileIndex)
    
    fileName = files(fileIndex(f)).name;
    
    if length(fileName) > 16,
        
        if strcmp(fileName(1:17),'neuBlockwithColID'),

                % Iterate current file count... 
                fileCount = fileCount + 1

                % Load perturbed neurons with micrcolumnar ID...
                file_potentials = strcat(directory_name, '/', fileName); % --- file with neuron to reproduce
                data1 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                data1 = reshape(data1, 4, length(data1)/4)';
                
                % Seperate data1 into old and micro IDs...
                ID = data1(:,1);

                % Load YOUNG neurons...
                file_potentials = strcat(directory_name, '/neuBlock_', fileName(19:27), '_000.xyz'); % --- file with neuron to reproduce
                dataYoung = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                dataYoung = reshape(dataYoung, 3, length(dataYoung)/3)';
                data = ScaleToMicrons(dataYoung, 1000);
                data = [ID data];
                
                for i = 1:length(L),
                    curL = L(i);
                    temp = zeros(1,4);
                    tempCount = 1;
                    for j = 1:length(data),
                        if any(data(j,2:4) > curL) == 0,  % Determines if a particular neuron is inside the box
                            temp(tempCount,:) = data(j,:);
                            tempCount = tempCount + 1;
                        end
                    end
                    micros(fileCount, i) = length(unique(temp(:,1))); % Determines the number of unique microcolumns per box of length curL
                end
                %curSquare = 2;
                %keeps = zeros(15,1);
                %for i = 1 : length(micros),
                %    if micros(i) >= curSquare^2,
                %        keeps(curSquare-1) = i;
                %        curSquare = curSquare + 1;
                %    end
                %end

        end
        
    end
end