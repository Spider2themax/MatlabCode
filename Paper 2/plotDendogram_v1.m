function results = plotDendogram_v1(spikes)

disp(' '); disp(' ')
fixed=1;            % use always the same random numbers (0-no,1-yes)
if fixed==0 rand('twister',sum(100*clock)); randn('state',sum(100*clock)); else rand('twister',5489); randn('state',5489); end %#ok<SEPEX>

d_para_default=struct('tmin',[],'tmax',[],'dts',1,...
    'all_train_group_names',[],'all_train_group_sizes',[],'select_train_mode',1,'select_train_groups',[],'select_trains',[],'separators',[],'separators2',[],...
    'select_averages',[],'trigger_averages',[],'markers',[],'markers2',[],'interval_separators',[],'interval_strings',[],'comment_string','');
d_para=d_para_default;

f_para_default=struct('imagespath',['.',filesep],'moviespath',['.',filesep],...    % Default values
    'matpath',['.',filesep],'filename','Demo_','title_string','',...
    'saving',0,'print_mode',1,'publication',1,'comment_string','','num_fig',1,'pos_fig',[130 120 1320 880],'font_size',14,'multi_figure',1,...
    'timeunit_string','[ms]','xfact',1,'ma_mode',0,'spike_mao',20,'time_mao',10,'dtm',1,...
    'mov_step',0,'mov_frames_per_second',1,'mov_num_average_frames',1,'mov_frames',[],...
    'plot_mode',1,'norm_mode',1,'color_norm_mode',1,'block_matrices',0,'dendrograms',0,'dendro_color_mode',0,'subplot_size',[],...
    'subplot_posi',[0 1  0 0  0 0 0 0  0 0    0 0 0 0 0 0     0 2 0 0 0 0]);
f_para_default.subplot_size=ones(1,length(f_para_default.subplot_posi(f_para_default.subplot_posi>0)));

f_para=f_para_default; 
d_para.tmin=0; 
d_para.tmax=500;
d_para.dts=0.001;
trig_trac1=1;
num_spikes=find(spikes(trig_trac1,:),1,'last');
d_para.select_averages={[d_para.tmin d_para.tmax]}; % One or more continuous intervals for selective temporal averaging
d_para.trigger_averages{1}=round(sort(spikes(trig_trac1,1:num_spikes))/d_para.dts)*d_para.dts;       % Triggered averaging over all time instants when a certain neuron fires
f_para.subplot_posi=[0 1  0 0  0 0 0 0  0 0    0 0 0 0 0 0     0 2 0 0 0 0]; % Vector with order of subplots
f_para.plot_mode=8;                % +1:vs time,+2-different measures and cuts,+4-different measures,+8-different cuts,+16:different cuts-Movie
f_para.dendrograms=1;              % Cluster trees from distance matrices (0-no,1-yes)
f_para.comment_string='Fig8';    % Additional comment on the example, will be used in file and figure names

f_para.dtm=d_para.dts;
f_para.num_fig=9*10;

disp(' '); disp(' ')
%f_distances_MEX
results=f_distances_MEX(spikes,d_para,f_para)
%results=f_distances(spikes,d_para,f_para)
disp(' '); disp(' ')