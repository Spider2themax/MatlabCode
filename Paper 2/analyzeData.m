function [] = analyzeData(dataDirectory)

%{
    This program will analzye the data for the second paper, concerned
    with network dynamics of neural networks with distance dependent
    connections.  To generate the data to properly study these systems, we
    will create networks with simple cubic lattice and random neurons.
    Then, we will connect the networks using either a random, nearest
    neighbor, small world, or probabilistic nearest neighbor network model.
    We will test our networks over 64, 125, and 216 sized networks with 5
    and 10 connections per neuron.

    Max Henderson
    Drexel University
    April 23, 2013
%}

%% Create directories to store data and generate networks.
tic
a = sprintf('/home/hendemd/Desktop/MATLAB/bin/Paper 2/%s/',dataDirectory);
%analyzeNetworksCrystal_v1(4, 1, dataDirectory)
%analyzeNetworksRandom_v1(4, 5, dataDirectory)
%analyzeNetworksCrystal_v1(5, 1, dataDirectory)
%analyzeNetworksRandom_v1(5, 5, dataDirectory)
%analyzeNetworksCrystal_v1(6, 1, dataDirectory)
%analyzeNetworksRandom_v1(6, 3, dataDirectory)
analyzeNetworksCrystal_v1(7, 1, dataDirectory)
%analyzeNetworksRandom_v1(6, 3, dataDirectory)
toc