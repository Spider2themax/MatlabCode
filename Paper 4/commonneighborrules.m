function conn2=Reorganize (conn, iter, r,m,p,pr,pnr,dist)

% 'conn' is the initial binary connectivity matrix (nxn)

% 'iter' is the number of iterations to perform (scalar)

% 'r' is the power given to the reorganization matric to (scalar)

% m' mean weight factor before applying power (scalar)

% p is the probability of connection as a function of distance applied to

%each pair (nxn)

% 'pr' is the reciprocal probability of connection as a function of distance

%applied to each pair (nxn)

% 'pnr' is the non-reciprocal probability of connection as a function of %distance applied to each pair (nxn)

% 'dist' is the distance between the nodes in each pair (nxn)

n=length (conn) ; %number of cells

ins=sum(conn) ; %array of column sums to determine

%number of inputs per cell

pc=n* (n-1) ; %number of possible connections

nc=sum (sum (conn) %number of actual connections

conn0=conn; %storing initial connectivity

conn2=conn; %allocating final connectivity

pp=p; %storing p

for ( i=l : iter)

conn=double (conn2) ; %to operate on results of last iteration

cn=getNC (conn) ; %get common neighbors

for (j=l :n)

cn ( : , j ) ;cn ( : , j ) / (m*mean (cn ( : , j ) ) ) ; %divide common neighbors by

%the weighted mean

cn ( : , j ) cn(:, j) . ??; %apply power

cn ( : , j ) =cn ( : , j ) . *pp ( : , j ) ; %keep distance relations cn ( : , j ) =cn ( : , j ) . /sum(cn ( : , j ) ) ; %normalize to 1

cn ( : , j )=cn( : , j ) *ins ( j ) ; %to keep total inputs constant end

pi=(cn+cn' ) /2; %extract connection probability weight in each pair

cpnr=pnr . /p . *pi; %define non-reciprocal connection probability cpr=pr . /p. *pi; %define reciprocal connection probability

rnd=rand (n) ; %define random matrix rnd=triu (rnd, 1) +tril (ones (n) ) ; %make it upper triangular cr=rnd<cpr; %reciprocal connections cnrl= (rnd< (cpr+cpnr) ) . * (rnd>= (cpr) ) ; %non-reciprocal one way cnr2= ( rnd< (cpr+2*cpnr) . * (rnd>= (cpr+cpnr) ) %non-reciprocal other way conn2=cr+cr ' +cnrl+cnr2 ' ; %final connectivity end Neural network devices that ar