function [data] = GetFRs()

data = zeros(12,32);
count = 1;

[data1] = GetNetworkFR('/data2/L/Brain/max/Paper2.5Data/K0.2/');
a = mean(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = mean(data1(:,:,4))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,4))';
data(:,count) = a;
count = count + 1;

[data1] = GetNetworkFR('/data2/L/Brain/max/Paper2.5Data/K0.1/');
a = mean(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = mean(data1(:,:,4))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,4))';
data(:,count) = a;
count = count + 1;

[data1] = GetNetworkFR('/data2/L/Brain/max/Paper2.5Data/K0.05/');
a = mean(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = mean(data1(:,:,4))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,4))';
data(:,count) = a;
count = count + 1;

[data1] = GetNetworkFR('/data2/L/Brain/max/Paper2.5Data/K0.03/');
a = mean(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = mean(data1(:,:,4))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,4))';
data(:,count) = a;
count = count + 1;

[data1] = GetNetworkFR('/data2/L/Brain/max/Paper2.5Data/K0.02/');
a = mean(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = mean(data1(:,:,4))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,4))';
data(:,count) = a;
count = count + 1;

[data1] = GetNetworkFR('/data2/L/Brain/max/Paper2.5Data/K0.015/');
a = mean(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = mean(data1(:,:,4))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,4))';
data(:,count) = a;
count = count + 1;

[data1] = GetNetworkFR('/data2/L/Brain/max/Paper2.5Data/K0.01/');
a = mean(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = mean(data1(:,:,4))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,4))';
data(:,count) = a;
count = count + 1;

[data1] = GetNetworkFR('/data2/L/Brain/max/Paper2.5Data/K0.005/');
a = mean(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,3))';
data(:,count) = a;
count = count + 1;
a = mean(data1(:,:,4))';
data(:,count) = a;
count = count + 1;
a = std(data1(:,:,4))';
data(:,count) = a;
count = count + 1;