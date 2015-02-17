function [Cchem, Celec] = AgeConnectivityCont(Cchem, Celec, D)

%{
    This program will 'age' connectivity matrices based off of how far
    individual neurons have moved from their initial positions in the
    'young' brain.  The loss is a continuous function wherein distance will
    erode the connectivity to some minimum lowStr value.

    Max Henderson
    February 10, 2014
    Drexel University
%}

%% Set initial conditions.
lowStr = 0;  %The minimum value of a scaled connection.
maxDistChem = 5;  %Defines the maximum distance before synapse reaches lowStr
maxDistElec = 2;  %Defines the maximum distance before synapse reaches lowStr

%% Scale synaptic connections.
Dchem1 = (D >= maxDistChem);
Cchem1 = Cchem.*Dchem1.*0.5;
Dchem2 = (D < maxDistChem);
Cchem2 = Cchem.*Dchem2.*(1 - ((1-lowStr)/maxDistChem)*D);
Cchem = Cchem1 + Cchem2;

%% Scale synaptic connections.
Delec1 = (D >= maxDistElec);
Celec1 = Celec.*Delec1.*0.5;
Delec2 = (D < maxDistElec);
Celec2 = Celec.*Delec2.*(1 - ((1-lowStr)/maxDistElec)*D);
Celec = Celec1 + Celec2;