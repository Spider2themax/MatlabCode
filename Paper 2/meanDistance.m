function [] = meanDistance()

meanD = zeros(7, 2);
netSize = zeros(7,1);
for i = 1:7,
   [mc, mr] = plotDist(i + 3, 0); 
   meanD(i,1) = mc;
   meanD(i,2) = mr;
   netSize(i) = (i+3)^3;
end
plot(netSize, meanD(:,1), netSize, meanD(:,2))