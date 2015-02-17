function [CIG, geo, Conn] = GetGridConn(currentDir, dim, fileIndex, con, age, a, n)
 
%{
    This program will determine the CIG of a given geometric
    network with regards to spatial organization.  The 3D network will be
    collapsed into a 2D grid, and the grid will have n*n nodes.  The
    neurons will be assigned to nodes respective to their position and the
    dimension in which they are being collapsed.  Each node is then
    evaluated in terms of CIG, which are saved.
 
    INPUT
 
    dim : Dimension (x,y, or z) in which the network will be collapsed
    geo : Geometric positions of each neuron
    a   : Length of the cubic neural block
    n   : Defines the number of grid points/nodes
    data: Firing data for neurons in the network

    OUTPUT

    CIG : average CIG value
    geo : geometry of network
    Conn : connectivity of the network
%}

%% Step 1 - Load geometry and spiking data.
if age == 1,  % Load young geometrical data 
    save = GetGeo(currentDir, fileIndex);
    file_potentials = strcat(currentDir, 'neuBlock_', save(19:27), '_000.xyz');
    geo = load( file_potentials );
    Conn = GetConn(currentDir, fileIndex, con, 1);
else
    file_potentials = strcat(currentDir,'data', int2str(fileIndex), '.txt');        
    geo = load( file_potentials );
    Conn = GetConn(currentDir, fileIndex, con, 3);
    plot3(geo(:,1), geo(:,2), geo(:,3),'s')
end
geo = ScaleToMicrons(geo, 280);
N = length(geo);  % Get number of neurons
IDfilename = strcat(currentDir, 'networkConstants', int2str(fileIndex), '.txt');
ID = load(IDfilename);
inhibIndex = ID(2);
Conn = Conn(1:inhibIndex-1, 1:inhibIndex-1);

%% Step 2 - Create grid respect to dim. 
if dim == 1,     % Analyze x-direction
    geo = [geo(:,2) geo(:,3)];
elseif dim == 2, % Analyze y-direction
    geo = [geo(:,1) geo(:,3)];
else             % Analyze z-direction
    geo = [geo(:,1) geo(:,2)];
end
b = a/(n-1);  % Length of each node.
c = b/2;      % Useful for speeding up calculations later
grid = zeros(n, n, 2);
for i = 1 : n,
    for j = 1 : n,
        grid(i,j,2) = (i-1)*b + c;
        
        grid(i,j,1) = (j-1)*b + c;
        
    end
end

%% Step 3 - Assign neurons to node points.
CIG = 0;
NCIG = 0;
num = zeros(i-1,j-1);
total = 0;
temps = zeros(1,1);
histCount = 1;
for i = 1:n-1, 
    for j = 1:n-1, % Iterate through all nodes
        
        temp = zeros(1,1); % Temp matrix to store neural indices
        count = 1;
        
        for k = 1:N, % Iterate through all neurons
            
            [temp, count] = GetInGrid(geo(k,:), grid(i,j,1), grid(i,j,2), a, b, c, temp, count, k, inhibIndex);

        end
        if i == 1 && j == 1,
            temp
        end
        
        temps(histCount,1) = length(temp);
        histCount = histCount + 1;
        
        if length(temp) > 1,
            
            for k = 1:length(temp),
            
                ii = temp(k);
                
                for jj = 1:length(Conn),
                    
                    if Conn(ii,jj) > 0,
                        
                        if any(temp == jj),
                            
                            CIG = CIG + 1;
                            
                        else
                            
                            NCIG = NCIG + 1;
                            
                        end
                        
                        Conn(ii,jj) = 0;
                        
                    end
                    
                    if Conn(jj,ii) > 0,
                        
                        if any(temp == jj),
                            
                            CIG = CIG + 1;
                            
                        else
                            
                            NCIG = NCIG + 1;
                            
                        end
                        
                        Conn(jj,ii) = 0;
                        
                    end
                    
                end
                
            end
            
        end
        
        total = total + length(temp);
    end
end
%hist(temps)
CIG=CIG/NCIG;