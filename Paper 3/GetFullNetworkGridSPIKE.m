function [datax, datay, dataz] = GetFullNetworkGridSPIKE(currentDir, d_para, f_para)

data = GetNetworkGridSPIKE(currentDir, d_para, f_para, 1);
datax = [data(:,:,1); data(:,:,2); data(:,:,3); data(:,:,4); data(:,:,5); data(:,:,6)];

data = GetNetworkGridSPIKE(currentDir, d_para, f_para, 2);
datay = [data(:,:,1); data(:,:,2); data(:,:,3); data(:,:,4); data(:,:,5); data(:,:,6)];

data = GetNetworkGridSPIKE(currentDir, d_para, f_para, 3);
dataz = [data(:,:,1); data(:,:,2); data(:,:,3); data(:,:,4); data(:,:,5); data(:,:,6)];