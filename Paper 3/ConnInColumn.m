function [CIC] = ConnInColumn(ID, con1)

%{
    This program will determine percentage of connections within neurons of
    a particular column VS neurons outside a particular column before and
    after the common neighbor law reordering process.

    Max Henderson
    June 3, 2014
    Drexel University
%}

%% Determine number of connections in column vs out column.
CIC = zeros(length(con1),1);
for i = 1 : length(con1),
   a = sum(con1(i,:)) + sum(con1(:,i)); % Get total connections for neuron i
   currColumn = ID(i); % Get microcolumn of neuron i
   b = sum(con1(i,:).*(ID(1:length(con1)) == currColumn)') + sum(con1(:,i).*(ID(1:length(con1)) == currColumn)); % Get connections within micro
   CIC(i) = b/a; % Return fractional percentage.
end