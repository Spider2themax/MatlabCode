function [idx1, idx2, idx3, idx4, connMicro] = TestCommonNeighborAlg(d, n, iter,geo)

%% Microcolumnar geometry...

tic

[cells,conn,dist,p,pr,pnr]=RP_AssembleNet(d,n,n,n,0,geo);

conn = conn>0;

s = dist.*conn;

[vals, P] = GetMedianP(s);

idx1 = apcluster(vals,P/2);

PM = PercentExemplarInMicro(idx1, geo)

connMicro=Reorganize(conn,iter,1,1,p,pr,pnr,dist);

connMicro = connMicro>0;

s = dist.*connMicro;

[vals, P] = GetMedianP(s);

idx2 = apcluster(vals,P/2);

PM = PercentExemplarInMicro(idx2, geo)

toc

%% Random geometry...

nc = length(cells);

newGeo = rand(nc,4)*300;

tic

[cells,conn,dist,p,pr,pnr]=RP_AssembleNet(d,n,n,n,0,newGeo);


conn2=Reorganize(conn,iter,1,1,p,pr,pnr,dist);

conn2 = conn2>0;

s = dist.*conn2;

[vals, p] = GetMedianP(s);

[idx2,netsim,dpsim,expref]=apcluster(vals,P);

[NC2, CS2] = AnalyzeClusters(idx2);

toc