function data = getTotalMeanAndSpike(dir, d_para, f_para)

% 64 neurons....

numNeurons = sprintf('%d',64);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = plotMeanAndSpikeDistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = plotMeanAndSpikeDistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = plotMeanAndSpikeDistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = plotMeanAndSpikeDistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/4/Nearest neighbors/');
n4  = plotMeanAndSpikeDistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/4/Exponential neighbors/');
e4  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/4/Random/');
r4  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/5/Nearest neighbors/');
n5  = plotMeanAndSpikeDistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/5/Exponential neighbors/');
e5  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/5/Random/');
r5  = plotMeanAndSpikeDistances(fp,64, 5, d_para, f_para);

rn = (n1 + n2 + n3 + n4 + n5)/5;
re = (e1 + e2 + e3 + e4 + e5)/5;
rr = (r1 + r2 + r3 + r4 + r5)/5;

data = [cn ce cr rn re rr];

% 125 neurons....
numNeurons = sprintf('%d',125);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = plotMeanAndSpikeDistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = plotMeanAndSpikeDistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = plotMeanAndSpikeDistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = plotMeanAndSpikeDistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/4/Nearest neighbors/');
n4  = plotMeanAndSpikeDistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/4/Exponential neighbors/');
e4  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/4/Random/');
r4  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/5/Nearest neighbors/');
n5  = plotMeanAndSpikeDistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/5/Exponential neighbors/');
e5  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/5/Random/');
r5  = plotMeanAndSpikeDistances(fp,125, 5, d_para, f_para);

rn = (n1 + n2 + n3 + n4 + n5)/5;
re = (e1 + e2 + e3 + e4 + e5)/5;
rr = (r1 + r2 + r3 + r4 + r5)/5;

data = [data cn ce cr rn re rr];

% 216 neurons....
numNeurons = sprintf('%d',216);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = plotMeanAndSpikeDistances(fp,216, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = plotMeanAndSpikeDistances(fp,216, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = plotMeanAndSpikeDistances(fp,216, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = plotMeanAndSpikeDistances(fp,216, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = plotMeanAndSpikeDistances(fp,216, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = plotMeanAndSpikeDistances(fp,216, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = plotMeanAndSpikeDistances(fp,216, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = plotMeanAndSpikeDistances(fp,216, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = plotMeanAndSpikeDistances(fp,216, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = plotMeanAndSpikeDistances(fp,216, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = plotMeanAndSpikeDistances(fp,216, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = plotMeanAndSpikeDistances(fp,216, 5, d_para, f_para);

rn = (n1 + n2 + n3)/3;
re = (e1 + e2 + e3)/3;
rr = (r1 + r2 + r3)/3;

data = [data cn ce cr rn re rr];

% 343 neurons....
numNeurons = sprintf('%d',343);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = plotMeanAndSpikeDistances(fp,343, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = plotMeanAndSpikeDistances(fp,343, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = plotMeanAndSpikeDistances(fp,343, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
rn  = plotMeanAndSpikeDistances(fp,343, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
re  = plotMeanAndSpikeDistances(fp,343, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
rr  = plotMeanAndSpikeDistances(fp,343, 5, d_para, f_para);

data = [data cn ce cr rn re rr];

