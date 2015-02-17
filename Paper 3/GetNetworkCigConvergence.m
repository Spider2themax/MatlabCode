function [CIG] = GetNetworkCigConvergence()

%{
    COMMENT THIS ALL LATER!!

    Max Henderson
    7/22/14
    Drexel University
%}

%% Make a bunch of different sized networks, keeping roughly 1-1 ratio between grid nodes and # microcolumns.
directory_name = '/data2/L/Brain/max/Paper2.5Data/ConvergenceTest/';
files = dir(directory_name);
fileIndex = find(~[files.isdir]);
fileCount = 0;
oldCount = 0;
%L =     [190   220   250   280   310   340   360   390   420   440]; % Lengths of box's for respective L
%nodes = [8     9     10    11    12    13    14    15    16    17 ]; % for going thru all nodes
L =     [   190   220   240   270   300   330   360   390   420   440   470   500];%   530];
nodes = [   8     9     10    11    12    13    14    15    16    17    18    19 ];%   20 ];
%L = 530;
%nodes = 20;

CIG = zeros(length(L),12,10);
TotalCons = zeros(length(L),4,10);

%% Use these 1-1 ratios to figure out CIG convergence.
for i = 1:length(fileIndex)
    
    fileName = files(fileIndex(i)).name;
    
    if length(fileName) > 16,
        
        if strcmp(fileName(1:17),'neuBlockwithColID'),

                % Iterate current file count... 
                fileCount = fileCount + 1;

                % Load perturbed neurons with micrcolumnar ID...
                file_potentials = strcat(directory_name, '/', fileName); % --- file with neuron to reproduce
                data1 = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                data1 = reshape(data1, 4, length(data1)/4)';
                
                % Seperate data1 into old and micro IDs...
                ID = data1(:,1);
                inhibIndex = GetInhibIndex(ID);

                % Load YOUNG neurons...
                file_potentials = strcat(directory_name, '/neuBlock_', fileName(19:27), '_000.xyz'); % --- file with neuron to reproduce
                dataYoung = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                dataYoung = reshape(dataYoung, 3, length(dataYoung)/3)';
                dataYoung = ScaleToMicrons(dataYoung, 1000); % Original entire network has size 1000
                
                % Keep only excitory neurons... 
                dataYoung = dataYoung(1:inhibIndex - 1,:);
                
        end
        
    end
    
    if fileCount > oldCount,
       
        % Iterate count...
        oldCount = oldCount + 1;
    
        % Iterate through all nodes, and determine proper size of network for
        % roughly 1-to-1 ratio.  After this, determine CIGx, CIGy, and CIGz.
        for j = 1 : length(nodes),
            
            % First, get the neurons for volume of length L with (node+1)^2
            % nodes...
            node = nodes(j)
            curL = L(j);
            temp = zeros(1,3);
            tempCount = 1;
            for k = 1:length(dataYoung),
                %N = length(geo);
                if any(dataYoung(k,1:3) > curL) == 0,  % Determines if a particular neuron is inside the box
                    temp(tempCount,:) = dataYoung(k,:);
                    tempCount = tempCount + 1;
                end
            end
            
            % Make a corresponding random network...
            dataRandom = curL*rand(size(temp,1), 3); % As many neurons as in temp
            
            % Now, figure out connections for each network...
            disp('Create connections..')
            [con1, con2] = ConnectNeurons_v1(temp, curL);
            [con3, con4] = ConnectNeurons_v1(dataRandom, curL);
            
            % Visualize system differences...
            %{

            hold on
            subplot(3,2,1)
            title('Micro BCN x-direction') 
            VisualizeGridConn(temp,       con1, curL, node, 1);
            view(45, 45);

            subplot(3,2,2)           
            title('Micro BCN y-direction') 
            VisualizeGridConn(temp,       con1, curL, node, 2);
            view(45, 45);

            subplot(3,2,3)                        
            title('Micro BCN z-direction') 
            VisualizeGridConn(temp,       con1, curL, node, 3);
            view(45, 45);

            subplot(3,2,4)         
            title('Micro ACN x-direction') 
            VisualizeGridConn(temp,       con2, curL, node, 1);
            view(45, 45);

            subplot(3,2,5)
            title('Micro ACN y-direction') 
            VisualizeGridConn(temp,       con2, curL, node, 2);
            view(45, 45);

            subplot(3,2,6)
            title('Micro ACN z-direction') 
            VisualizeGridConn(temp,       con2, curL, node, 3);
            view(45, 45);
            
            %}

            disp('Get CIG for network...')
            % With connectivity, determine CIGx...
            CIG(j,1,fileCount)  = GetCIG(temp,       con1, curL, node, 1);
            CIG(j,2,fileCount)  = GetCIG(temp,       con2, curL, node, 1);
            CIG(j,3,fileCount)  = GetCIG(dataRandom, con3, curL, node, 1);
            CIG(j,4,fileCount)  = GetCIG(dataRandom, con4, curL, node, 1);
            
            % With connectivity, determine CIGy...
            CIG(j,5,fileCount)  = GetCIG(temp,       con1, curL, node, 2);
            CIG(j,6,fileCount)  = GetCIG(temp,       con2, curL, node, 2);
            CIG(j,7,fileCount)  = GetCIG(dataRandom, con3, curL, node, 2);
            CIG(j,8,fileCount)  = GetCIG(dataRandom, con4, curL, node, 2);
            
            % With connectivity, determine CIGz...
            CIG(j,9,fileCount)  = GetCIG(temp,       con1, curL, node, 3);
            CIG(j,10,fileCount) = GetCIG(temp,       con2, curL, node, 3);
            CIG(j,11,fileCount) = GetCIG(dataRandom, con3, curL, node, 3);
            CIG(j,12,fileCount) = GetCIG(dataRandom, con4, curL, node, 3);
            
            % Also save total connections per neuron
            TotalCons(j,1,fileCount)  = sum(sum(con1))/(2*size(temp,1)^2);
            TotalCons(j,2,fileCount)  = sum(sum(con2))/(2*size(temp,1)^2);
            TotalCons(j,3,fileCount)  = sum(sum(con3))/(2*size(temp,1)^2);
            TotalCons(j,4,fileCount)  = sum(sum(con4))/(2*size(temp,1)^2);
            
            CIG(:,:,fileCount)
            TotalCons(:,:,fileCount)
            
        end
       
    end
        
end