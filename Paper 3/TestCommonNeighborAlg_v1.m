function [idx1, idx2, PM1, PM2, dist] = TestCommonNeighborAlg_v1(d, n, iter,geo)



%% Microcolumnar geometry...

tic

[conn,dist,p,pr,pnr]=RP_AssembleNet(geo, 0);

conn = conn>0;

s = dist.*conn;

[vals, P] = GetMedianP(s);

idx1 = apcluster(vals,P);

PM1 = PercentExemplarInMicro(idx1, geo);

connMicro=Reorganize(conn,iter,1,1,p,pr,pnr,dist);

connMicro = connMicro>0;

s = dist.*connMicro;

[vals, P] = GetMedianP(s);

idx2 = apcluster(vals,P);

PM2 = PercentExemplarInMicro(idx2, geo);

toc
