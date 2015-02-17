function [cells, conn, dist, p, pr,pnr] = RP_AssembleNet (d, nx, ny, nz, pair)

%'d' is the average distance between adjacent cells (36 usually)

%'nx' is the number of rows (10 usually)

%'ny' is the number of columns (10 usually)

%'nz' is the number of layers (10 usually)

%'pair' relevance of pairwise patterns (0-no, 1-yes)

acc=1; %initialize counter variable

nc=nx*ny*nz; %calculate total nuber of cells

pr=0; %initialize reciprocal connection probability 

pnr=0; %initialize non-reciprocal connection probability 

cells=zeros (nc, 6) ; %initialize cell information matrix

for i=1:nx %for each row

    for j=1:ny %for each column

        for k=1:nz %for each layer

            cells (acc, 1) =i*d; %define base x position

            cells (acc, 2 ) =j *d; %define base y position

            cells (acc, 3) =k*d; %define base z position

            acc=acc+1; %increase counter for next cell 
        end

    end

end

r=rand (nc, 3) *30; %create random matrix in range 0-30 

cells ( : , 1 : 3) =cells ( : , 1 : 3) +r ; %add jitter to cell positions in x,y and z 

r=rand (nc) +eye (nc) ; %define random matrix with ones in diagonal (to ignore autapses)

dist=zeros (nc, nc) ; %initialize distance matrix

for i=1 :nc

    for j=i+1 :nc %for every possible pair

        dx=cells (i, 1) -cells ( j , 1); %calculate dx

        dy=cells (i,2) -cells ( j , 2); %calculate dy

        dz=cells (i, 3) -cells ( j , 3); %calculate dz

        dist (i, j ) =sqrt (dx*dx+dy*dy+dz*dz) ; %calculate distance

        dist ( j , i) =dist (i, j ) ; %distance is simmetric 
    end

end

[C, pr]=DistanceDependent_v1(dist, nc, 1);%reciprocal connection probability matrix 

pr = pr*2/3;

%pr=RP_DistprobPair (dist, 2 ) ; %reciprocal connection probability matrix 

pnr=pr.*pr /2; %0.5*non-reciprocal connection prob. matrix

p=pnr+pr; %probability of connection matrix 

if (pair==0) %if pairwise connectivity is not relevant 
    
    conn=r<p; %connectivity is defined by p

else %if pairwise relationship is relevant

    r=triu (r, 1) +tril (ones (nc) ) ; %define upper triangular random matrix 
    
    cr=r<pr; %define reciprocal connections 
    
    cnrl= (r< (pr+pnr) ) .* (r>= (pr) ) ; %define non reciprocal one-way 
    
    cnr2= ( r< (pr+2*pnr ) .* ( r>= (pr+pnr ) ) ) ; %define non reciprocal other-way 
    
    conn=cr+cr' +cnrl+cnr2'; %final connectivity
end