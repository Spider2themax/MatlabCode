function [beta, modelfun] = CheckFunctionFitting_v1(modelType, plotOrNot)

%% Find parameters to fit function.
x = [20
50
90
125
155
195
230
265
300];
y1 = [0.22
0.17
0.15
0.13
0.095
0.105
0.07
0.035
0.08];
y2 = [0.12
0.07
0.06
0.04
0.03
0.04
0.02
0
0.04];
y3 = [0.2
0.205
0.18
0.17
0.14
0.145
0.105
0.075
0.08];
if modelType == 1,
    y = y1;
elseif modelType == 2,
    modelType = 1;
    y = y2;
else
    y = y3;
end
if modelType == 1,
    modelfun = @(b,x)(b(1)+b(2)*exp(-x/b(3)));

    opts = statset('nlinfit');
    opts.RobustWgtFun = 'bisquare';

    beta0 = [0.33;1;100];
    beta = nlinfit(x,y,modelfun,beta0,opts);
else
    modelfun = @(b,x)(b(1)+b(2)*x);

    opts = statset('nlinfit');
    opts.RobustWgtFun = 'bisquare';

    beta0 = [0.33;1];
    beta = nlinfit(x,y,modelfun,beta0,opts);
end

%% Check with a plot!
if plotOrNot == 1,
    hold on
    plot(x,y,'s')
    x = linspace(0, 300, 301);
    plot(x, modelfun(beta,x))
end