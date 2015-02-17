function idx = TestIdealMicro(geo)

%% Test ideal microcolumnar connectivity...
cells = geo(:,2:4);
scale = max(max(cells));
cells = cells/scale*300;
nc = length(geo);
cells = [geo(:,1) cells];
dist = CalculatePeriodicDistances(nc, cells, 2);
vals = zeros(length(geo),3);
count = 1;
for i = 1:length(geo)-1,
    for j = i+1:length(geo),
        if geo(i,1) == geo(j,1),
            vals(count,1) = i;
            vals(count,2) = j;
            vals(count,3) = -dist(i,j);
            count = count + 1;
        end
    end
end
vals
[idx,netsim,dpsim,expref]=apcluster(vals,-150,'plot');