function [diff, rsq_adj] = RegressionAnalysis_v1(s, N)

[tDiff] = GroupGofT_v0(s, N);
y = hist(tDiff, 250);
%Scale y
for i = 1:250,
    y(i) = y(i)/(250 - i + 1);
end
y = y/sum(y);
x = linspace(1,250,250);
plot(x,y)

%For each step, calculate the difference from the mean.
avg =  mean(y);
diff = 0;
for i = 1:250,
    diff = diff + abs(y(i)-avg);
end

p = polyfit(x,y,3);
%p(1) is the slope and p(2) is the intercept of the linear predictor. You can also obtain regression coefficients using the Basic Fitting GUI.

%Call polyval to use the coefficients in p to predict y, naming the result yfit:
yfit = polyval(p,x);

%Compute the residual values as a vector signed numbers:
yresid = y - yfit;

%Square the residuals and total them obtain the residual sum of squares:
SSresid = sum(yresid.^2);

%Compute the total sum of squares of y by multiplying the variance of y by the number of observations minus 1:
SStotal = (length(y)-1) * var(y);

%Compute simple R2 for the cubic fit using the formula given in the introduction of this topic:
rsq = 1 - SSresid/SStotal;

%Finally, compute adjusted R2 to account for degrees of freedom:
rsq_adj = 1 - SSresid/SStotal * (length(y)-1)/(length(y)-length(p));