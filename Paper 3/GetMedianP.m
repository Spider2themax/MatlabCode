function [vals, p] = GetMedianP(s)

%{
    This program will determine the median similarity between connected
    nodes in a particular network.

    Max Henderson
    May 24, 2014
    Drexel University
%}

%% Go thru distance matrix and keep non-zero values.
vals = zeros(10,3);
count = 1;
for i = 1:length(s)-1,
    for j = i+1:length(s),
        if abs(s(i,j)) > 0,
            vals(count,1) = i;
            vals(count,2) = j;
            vals(count,3) = -abs(s(i,j));
            count = count + 1;
        end
    end
end
p = median(vals(:,3));