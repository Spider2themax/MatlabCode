function [conn,p,pr,pnr]=RP_AssembleNet(pair, dist, nc)

r=rand(nc)+eye(nc); %define random matrix with ones in diagonal

pnr=RP_DistprobPair(dist,1); %0.5*non-reciprocal connection prob. matrix

pr=RP_DistprobPair(dist,1).^2; %reciprocal connection probability matrix

p=pnr+pr; %probability of connection matrix

if(pair==0) %if pairwise connectivity is not relevant
    conn=r<p; %connectivity is defined by p
else %if pairwise relationship is relevant
    r=triu(r,1)+tril(ones(nc)); %define upper triangular random matrix
    cr=r<pr; %define reciprocal connections
    cnr1=(r<(pr+pnr)).*(r>=(pr)); %define non reciprocal one-way
    cnr2=(r<(pr+2*pnr).*(r>=(pr+pnr))); %define non reciprocal other-way
    conn=cr+cr'+cnr1+cnr2'; %final connectivity
end

% Try something else for generating conn...
%for i = 1:length(conn),
%    for j = 1 : length(conn),
%        if i ~= j,
%            if pnr(i,j) > r(i,j),
%                conn(i,j) = 1;
%            else
%                conn(i,j) = 0;
%            end
%        end
%    end
%end