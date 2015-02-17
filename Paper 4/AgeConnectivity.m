function [CchemCont, CelecCont, CchemDisc, CelecDisc] = AgeConnectivity(Cchem, Celec, D)

%{
    This program will 'age' connectivity matrices based off of how far
    individual neurons have moved from their initial positions in the
    'young' brain.

    Max Henderson
    February 10, 2014
    Drexel University
%}

%% Adjust connectivity based on continuous aging process.
[CchemCont, CelecCont] = AgeConnectivityCont(Cchem, Celec, D);
[CchemDisc, CelecDisc] = AgeConnectivityDisc(Cchem, Celec, D);