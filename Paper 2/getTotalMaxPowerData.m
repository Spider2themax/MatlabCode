function data = getTotalMaxPowerData(dir)

% 64 neurons....
numNeurons = sprintf('%d',64);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = getMaxNetworkPowerMFP(fp,64, 1);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = getMaxNetworkPowerMFP(fp,64, 5);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = getMaxNetworkPowerMFP(fp,64, 5);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = getMaxNetworkPowerMFP(fp,64, 1);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = getMaxNetworkPowerMFP(fp,64, 5);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = getMaxNetworkPowerMFP(fp,64, 5);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = getMaxNetworkPowerMFP(fp,64, 1);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = getMaxNetworkPowerMFP(fp,64, 5);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = getMaxNetworkPowerMFP(fp,64, 5);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = getMaxNetworkPowerMFP(fp,64, 1);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = getMaxNetworkPowerMFP(fp,64, 5);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = getMaxNetworkPowerMFP(fp,64, 5);

fp = strcat(dir, '/', numNeurons, '/Random/4/Nearest neighbors/');
n4  = getMaxNetworkPowerMFP(fp,64, 1);
fp = strcat(dir, '/', numNeurons, '/Random/4/Exponential neighbors/');
e4  = getMaxNetworkPowerMFP(fp,64, 5);
fp = strcat(dir, '/', numNeurons, '/Random/4/Random/');
r4  = getMaxNetworkPowerMFP(fp,64, 5);

fp = strcat(dir, '/', numNeurons, '/Random/5/Nearest neighbors/');
n5  = getMaxNetworkPowerMFP(fp,64, 1);
fp = strcat(dir, '/', numNeurons, '/Random/5/Exponential neighbors/');
e5  = getMaxNetworkPowerMFP(fp,64, 5);
fp = strcat(dir, '/', numNeurons, '/Random/5/Random/');
r5  = getMaxNetworkPowerMFP(fp,64, 5);

rn = (n1 + n2 + n3 + n4 + n5)/5;
re = (e1 + e2 + e3 + e4 + e5)/5;
rr = (r1 + r2 + r3 + r4 + r5)/5;

data = [cn ce cr rn re rr];

% 125 neurons....
numNeurons = sprintf('%d',125);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = getMaxNetworkPowerMFP(fp,125, 1);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = getMaxNetworkPowerMFP(fp,125, 5);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = getMaxNetworkPowerMFP(fp,125, 5);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = getMaxNetworkPowerMFP(fp,125, 1);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = getMaxNetworkPowerMFP(fp,125, 5);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = getMaxNetworkPowerMFP(fp,125, 5);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = getMaxNetworkPowerMFP(fp,125, 1);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = getMaxNetworkPowerMFP(fp,125, 5);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = getMaxNetworkPowerMFP(fp,125, 5);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = getMaxNetworkPowerMFP(fp,125, 1);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = getMaxNetworkPowerMFP(fp,125, 5);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = getMaxNetworkPowerMFP(fp,125, 5);

fp = strcat(dir, '/', numNeurons, '/Random/4/Nearest neighbors/');
n4  = getMaxNetworkPowerMFP(fp,125, 1);
fp = strcat(dir, '/', numNeurons, '/Random/4/Exponential neighbors/');
e4  = getMaxNetworkPowerMFP(fp,125, 5);
fp = strcat(dir, '/', numNeurons, '/Random/4/Random/');
r4  = getMaxNetworkPowerMFP(fp,125, 5);

fp = strcat(dir, '/', numNeurons, '/Random/5/Nearest neighbors/');
n5  = getMaxNetworkPowerMFP(fp,125, 1);
fp = strcat(dir, '/', numNeurons, '/Random/5/Exponential neighbors/');
e5  = getMaxNetworkPowerMFP(fp,125, 5);
fp = strcat(dir, '/', numNeurons, '/Random/5/Random/');
r5  = getMaxNetworkPowerMFP(fp,125, 5);

rn = (n1 + n2 + n3 + n4 + n5)/5;
re = (e1 + e2 + e3 + e4 + e5)/5;
rr = (r1 + r2 + r3 + r4 + r5)/5;

data = [data cn ce cr rn re rr];

% 216 neurons....
numNeurons = sprintf('%d',216);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = getMaxNetworkPowerMFP(fp,216, 1);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = getMaxNetworkPowerMFP(fp,216, 5);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = getMaxNetworkPowerMFP(fp,216, 5);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = getMaxNetworkPowerMFP(fp,216, 1);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = getMaxNetworkPowerMFP(fp,216, 5);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = getMaxNetworkPowerMFP(fp,216, 5);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = getMaxNetworkPowerMFP(fp,216, 1);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = getMaxNetworkPowerMFP(fp,216, 5);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = getMaxNetworkPowerMFP(fp,216, 5);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = getMaxNetworkPowerMFP(fp,216, 1);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = getMaxNetworkPowerMFP(fp,216, 5);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = getMaxNetworkPowerMFP(fp,216, 5);

rn = (n1 + n2 + n3)/3;
re = (e1 + e2 + e3)/3;
rr = (r1 + r2 + r3)/3;

data = [data cn ce cr rn re rr];
