function [Cchem, Celec] = AgeConnectivityDisc(Cchem, Celec, D)

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
maxDistChem = 5;  %Defines the maximum distance before synapse reaches lowStr
maxDistElec = 2;  %Defines the maximum distance before synapse reaches lowStr

%% Scale synaptic connections.
Dchem = (D >= maxDistChem);
Cchem = Cchem - Dchem;
Dneg = (Cchem < 0);
Cchem = Cchem + Dneg;

%% Scale synaptic connections.
Delec = (D >= maxDistElec);
Celec = Celec - Delec;
Dneg = (Celec < 0);
Celec = Celec + Dneg;