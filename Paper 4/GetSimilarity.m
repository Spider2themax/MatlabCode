function [S, p] = GetSimilarity(conn, dist)

%% Get similarity from Euclidean distances.
S = -conn .* dist;

%% Get preference values using the median of distances.
n = length(S);

d = zeros(2,1);

count = 1;

for i = 1:n-1,
    
    for j = i+1:n,
        
        if S(i,j) < 0,
            
            d(count) = S(i,j);
            
            count = count + 1; % Iterate count
            
        end
        
    end
    
end

p = median(d);  % Return median value