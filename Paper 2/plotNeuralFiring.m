function [F] = plotNeuralFiring(numNeurons, t, positions)
%{
    This function will allow users to visualize the neural firing patterns
    for a neural network.  In the file spikes.txt, the potential across all
    the neurons in the network are stored, and in the file positions.txt
    are the spatial origins of all the neuronsin the network.  This
    function will show the neurons in the network firing by color; green is
    dormant and red is spiking.

%}

%% Set constants.
%dir = 'Probabilistic neighbors';

%% Read in the potentials across the neurons from the simulation.
%file_potentials = strcat('/home/hendemd/Desktop/MATLAB/bin/Neural research/',dir,'/spikes.txt'); % --- file with neuron to reproduce
%t = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
%{
Number of columns in the data matrix will be the number of neurons in the
simulation plus one, which will contain the time data.
%}
data = reshape(t,numNeurons+1,size(t,1)/(numNeurons+1))';

%% Get positions of neurons in the network.
%file_positions = strcat('/home/hendemd/Desktop/MATLAB/bin/Neural research/',dir,'/Positions.txt');
%fid = fopen(file_positions);
%positions = textscan(fid, '%f', 'delimiter', ',');
%fclose(fid);
%positions = reshape(positions{1},3,size(positions{1},1)/3)';

%% Get synaptic connections matrix for graphing connectivity of neurons.
%{
syn_connections = strcat('/home/hendemd/Desktop/MATLAB/bin/Neural research/',dir,'/Connections.txt');
fid = fopen(syn_connections);
syn = textscan(fid, '%f', 'delimiter', ',');
fclose(fid);
syn = reshape(syn{1},9,size(syn{1},1)/9)';
[l w] = size(syn);
%}

%% Plot the neural network.
time = length(data)/10;
set(gca,'nextplot','replacechildren');
counter = 1;
step = 10;
for i = 200:500,
   hold on
   for j = 1:numNeurons,
       plotSpike(positions(j,:), data(i*step,j));
   end
   %for k = 1:l,
      %plotSyn(syn, positions,k);
   %end
   view([-37.5 35])
   pause(0.01);
   F(counter) = getframe(gcf);
   counter = counter + 1;
   clf
end
