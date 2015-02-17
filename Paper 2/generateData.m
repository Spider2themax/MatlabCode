function [] = generateData(dataDirectory, numcon)

%{
    This program will generate the data for the second paper, concerned
    with network dynamics of neural networks with distance dependent
    connections.  To generate the data to properly study these systems, we
    will create networks with simple cubic lattice and random neurons.
    Then, we will connect the networks using either a random, nearest
    neighbor, small world, or probabilistic nearest neighbor network model.
    We will test our networks over 64, 125, and 216 sized networks with 5
    and 10 connections per neuron.

    Max Henderson
    Drexel University
    Feb 28, 2013
%}

%% Create directories to store data and generate networks.
a = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/',dataDirectory);
mkdir(a)
cd(a)
mkdir('64')
mkdir('125')
mkdir('216')
cd('/home/hendemd/Desktop/MATLAB/bin/Paper 2/')
%crystalNetworks_v1(4, 1, dataDirectory)
%crystalNetworks_v1(5, 1, dataDirectory)
crystalNetworks_v2(7, 1, dataDirectory, numcon)
%randomNetworks_v2(4, 5, 100, dataDirectory)
%randomNetworks_v2(5, 5, 100, dataDirectory)
randomNetworks_v2(7, 1, 100, dataDirectory, numcon)