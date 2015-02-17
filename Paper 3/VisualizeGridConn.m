function [] = VisualizeGridConn(geo, Conn, curL, node, dim)
 
%{
    This program will be used to visualize how a network is connected for a
    particular grid node.  Iteratively, a movie will play wherein each
    neuron in the grid node will be connected to all it's neural
    connections, and by color, indicate whether each connection is to
    neurons of the same or different grid nodes.
 
    INPUT
 
    dim : Dimension (x,y, or z) in which the network will be collapsed
    geo : Geometric positions of each neuron
    a   : Length of the cubic neural block
    n   : Defines the number of grid points/nodes
    data: Firing data for neurons in the network

    Max Henderson
    10/6/14
    Drexel University
%}

%% Step 1 - Create grid respect to dim. 
a = curL;
n = node;
oldGeo = geo; % for plotting purposes
if dim == 1,     % Analyze x-direction
    geo = [geo(:,2) geo(:,3)];
elseif dim == 2, % Analyze y-direction
    geo = [geo(:,1) geo(:,3)];
else             % Analyze z-direction
    geo = [geo(:,1) geo(:,2)];
end
b = a/(n-1);  % Length of each node.
c = b/2;      % Useful for speeding up calculations laterCIGz Rand ACN
grid = zeros(n, n, 2);
for i = 1 : n,
    for j = 1 : n,
        grid(i,j,2) = (i-1)*b + c;
        
        grid(i,j,1) = (j-1)*b + c;
        
    end
end
geo = geo(1:length(Conn),:);
N = length(geo);

%% Step 2 - Assign neurons to node points.
CIG = 0;
NCIG = 0;
total = 0;
for i = 1:n-1, 
    for j = 1:n-1, % Iterate through all nodes
        
        temp = zeros(1,1); % Temp matrix to store neural indices
        count = 1;
        
        for k = 1:N, % Iterate through all neurons
            
            [temp, count] = GetInGrid(geo(k,:), grid(i,j,1), grid(i,j,2), a, b, c, temp, count, k, 100000000000); % inhibIndex normally goes in last spot

        end
        
        if length(temp) > 1 && i == 5 && j == 5,
            
            hold on
            
            % First, plot the entire grid node:
                        
            plot3(oldGeo(temp',1), oldGeo(temp',2), oldGeo(temp',3),'s')
            
            axis([0 curL 0 curL])
            
            for k = 1:length(temp),
            
                ii = temp(k);
                
                for jj = 1:length(Conn),
                    
                    if Conn(ii,jj) > 0,
                        
                        if any(temp == jj), % This means conn is in grid
                            
                            plot3([oldGeo(ii,1) oldGeo(jj,1)], [oldGeo(ii,2) oldGeo(jj,2)], [oldGeo(ii,3) oldGeo(jj,3)], 'b')
                            
                        else                % This means conn is not in grid
                            
                            plot3([oldGeo(ii,1) oldGeo(jj,1)], [oldGeo(ii,2) oldGeo(jj,2)], [oldGeo(ii,3) oldGeo(jj,3)], 'r')
                            
                        end
                        
                        Conn(ii,jj) = 0;
                        
                    end
                    
                end
                
            end
            
        end
        
        total = total + length(temp);
    end
end