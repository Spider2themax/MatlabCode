function data = getTotalISIandSPIKEdistData(dir, d_para, f_para)
%{
% 64 neurons....
numNeurons = sprintf('%d',64);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = getISIandSPIKEdistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = getISIandSPIKEdistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = getISIandSPIKEdistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = getISIandSPIKEdistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/4/Nearest neighbors/');
n4  = getISIandSPIKEdistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/4/Exponential neighbors/');
e4  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/4/Random/');
r4  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/5/Nearest neighbors/');
n5  = getISIandSPIKEdistances(fp,64, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/5/Exponential neighbors/');
e5  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/5/Random/');
r5  = getISIandSPIKEdistances(fp,64, 5, d_para, f_para);

rn = (n1 + n2 + n3 + n4 + n5)/5;
re = (e1 + e2 + e3 + e4 + e5)/5;
rr = (r1 + r2 + r3 + r4 + r5)/5;

data = [cn ce cr rn re rr];

% 125 neurons....
numNeurons = sprintf('%d',125);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = getISIandSPIKEdistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = getISIandSPIKEdistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = getISIandSPIKEdistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = getISIandSPIKEdistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/4/Nearest neighbors/');
n4  = getISIandSPIKEdistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/4/Exponential neighbors/');
e4  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/4/Random/');
r4  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/5/Nearest neighbors/');
n5  = getISIandSPIKEdistances(fp,125, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/5/Exponential neighbors/');
e5  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/5/Random/');
r5  = getISIandSPIKEdistances(fp,125, 5, d_para, f_para);

rn = (n1 + n2 + n3 + n4 + n5)/5;
re = (e1 + e2 + e3 + e4 + e5)/5;
rr = (r1 + r2 + r3 + r4 + r5)/5;

data = [data cn ce cr rn re rr];

% 216 neurons....
numNeurons = sprintf('%d',216);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = getISIandSPIKEdistances(fp,216, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = getISIandSPIKEdistances(fp,216, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = getISIandSPIKEdistances(fp,216, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
n1  = getISIandSPIKEdistances(fp,216, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
e1  = getISIandSPIKEdistances(fp,216, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
r1  = getISIandSPIKEdistances(fp,216, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/2/Nearest neighbors/');
n2  = getISIandSPIKEdistances(fp,216, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Exponential neighbors/');
e2  = getISIandSPIKEdistances(fp,216, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/2/Random/');
r2  = getISIandSPIKEdistances(fp,216, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/3/Nearest neighbors/');
n3  = getISIandSPIKEdistances(fp,216, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Exponential neighbors/');
e3  = getISIandSPIKEdistances(fp,216, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/3/Random/');
r3  = getISIandSPIKEdistances(fp,216, 5, d_para, f_para);

%}

numNeurons = sprintf('%d',343);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Nearest neighbors/');
cn  = getISIandSPIKEdistances(fp,343, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Exponential neighbors/');
ce  = getISIandSPIKEdistances(fp,343, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Crystal/1/Random/');
cr  = getISIandSPIKEdistances(fp,343, 5, d_para, f_para);

fp = strcat(dir, '/', numNeurons, '/Random/1/Nearest neighbors/');
rn  = getISIandSPIKEdistances(fp,343, 1, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Exponential neighbors/');
re  = getISIandSPIKEdistances(fp,343, 5, d_para, f_para);
fp = strcat(dir, '/', numNeurons, '/Random/1/Random/');
rr  = getISIandSPIKEdistances(fp,343, 5, d_para, f_para);

data = [cn ce cr rn re rr];