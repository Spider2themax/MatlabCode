function [] = NeuralCompensation(young, aged)

%{
    This program will take two connectivity matrices, young and aged, and
    compensate for the lost connections in the aged network by making the
    still exist connections stronger in a proportional fashion.

    Max Henderson
    June 18, 2014
    Drexel University
%}

