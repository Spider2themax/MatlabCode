function [conn, D, p, pr,pnr] = RP_AssembleNet_v1 (data, pair)



%'pair' relevance of pairwise patterns (0-no, 1-yes)
data
nc =  length(data);

D = CalculatePeriodicDistances(nc, data(:,2:4)); %For distances between young neurons

[C, pr]=DistanceDependent_v1(D, nc, 1);%reciprocal connection probability matrix 

pr = pr*2/3;

%pr=RP_DistprobPair (dist, 2 ) ; %reciprocal connection probability matrix 

pnr=pr.*pr /2; %0.5*non-reciprocal connection prob. matrix

p=pnr+pr; %probability of connection matrix 

r=rand (nc) +eye (nc) ; %define random matrix with ones in diagonal (to ignore autapses)

if (pair==0) %if pairwise connectivity is not relevant 
    
    conn=r<p; %connectivity is defined by p

else %if pairwise relationship is relevant

    r=triu (r, 1) +tril (ones (nc) ) ; %define upper triangular random matrix 
    
    cr=r<pr; %define reciprocal connections 
    
    cnrl= (r< (pr+pnr) ) .* (r>= (pr) ) ; %define non reciprocal one-way 
    
    cnr2= ( r< (pr+2*pnr ) .* ( r>= (pr+pnr ) ) ) ; %define non reciprocal other-way 
    
    conn=cr+cr' +cnrl+cnr2'; %final connectivity
end