function PM = PercentExemplarInMicro(idx, geo)

%{
    This program will determine the percentage of neurons who belong to a
    cluster of which the exemplar of the cluster is within the microcolumn.

    Max Henderson
    May 27, 2014
    Drexel University
%}

%% Determine if neurons belong to their clusters or not.
PM = 0; % Initialize percent in micro
for i = 1:length(idx),
   if geo(i,1) == geo(idx(i),1),
      PM = PM + 1; 
   end
end