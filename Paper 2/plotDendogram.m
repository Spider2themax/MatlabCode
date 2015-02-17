function [] = plotDendogram(spikes, d_para, f_para, N)

%% Set d_para.
d_para.tmin = 0;
d_para.tmax = 500;
d_para.dts = 1.0000e-03;

%% Set spike data.
%spikes = reshape(spikes, N, N);
trig_trac1=1;
num_spikes=find(spikes(trig_trac1,:),1,'last');
d_para.select_averages={[d_para.tmin d_para.tmax]}; % One or more continuous intervals for selective temporal averaging
d_para.trigger_averages{1}=round(sort(spikes(trig_trac1,1:num_spikes))/d_para.dts)*d_para.dts;       % Triggered averaging over all time instants when a certain neuron fires
f_para.subplot_posi=[0 1  0 0  0 0 0 0  0 0    0 0 0 0 0 0     0 2 0 0 0 0]; % Vector with order of subplots
f_para.plot_mode=8;                % +1:vs time,+2-different measures and cuts,+4-different measures,+8-different cuts,+16:different cuts-Movie
f_para.dendrograms=1;              % Cluster trees from distance matrices (0-no,1-yes)
f_para.comment_string='Fig8';    % Additional comment on the example, will be used in file and figure names
f_para.dtm=d_para.dts;
esc = 8;
f_para.num_fig=esc*10;
disp(' '); disp(' ')
results=f_distances_MEX(spikes,d_para,f_para)