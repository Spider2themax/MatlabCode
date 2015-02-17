function [data] = CIG()

[data1] = GetNetworkCIG('/data2/L/Brain/max/Paper2.5Data/K0.005/');

[data2] = GetNetworkCIG('/data2/L/Brain/max/Paper2.5Data/K0.01/');

[data3] = GetNetworkCIG('/data2/L/Brain/max/Paper2.5Data/K0.015/');

[data4] = GetNetworkCIG('/data2/L/Brain/max/Paper2.5Data/K0.02/');

[data5] = GetNetworkCIG('/data2/L/Brain/max/Paper2.5Data/K0.03/');

[data6] = GetNetworkCIG('/data2/L/Brain/max/Paper2.5Data/K0.05/');

[data7] = GetNetworkCIG('/data2/L/Brain/max/Paper2.5Data/K0.1/');

[data8] = GetNetworkCIG('/data2/L/Brain/max/Paper2.5Data/K0.2/');

data = [data1; data2; data3; data4; data5; data6; data7; data8];