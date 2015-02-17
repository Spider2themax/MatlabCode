function [] = LoadNeuralNetworksTest(directory_name)

%{
    This program will be used to load all neural network data into our
    algorithms for determining neural network connectivity.  Each neural
    network will have a large number of neurons that will be marked using
    two files representing neural placements before and after neurons are 
    iteratively moved according to methods outlined elsewhere
    (Henderson, Cruz, Urbanc 2014).  These files are then segmented further
    so that each microcolumnar ID number will be recorded for each neuron,
    so one can obtain how neurons move relative to individual microcolumns.

    Max Henderson
    December 28, 2013
    Drexel University
%}

fileCount = 1;
data = rand(100, 7)*100;
ConnectNeurons_v1(directory_name, data, fileCount);