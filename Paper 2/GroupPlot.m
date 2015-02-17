function [] = GroupPlot(spike, s0, s10, s100, N, means, stds)

strength = [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;30;40;50;100]/100;

hold on

subplot(4,2,1)
plotSpikeTrains_v1(s0, N, 500)

subplot(4,2,2)
GroupGofT_v0(s0, N);

subplot(4,2,3)
plotSpikeTrains_v1(s10, N, 500)

subplot(4,2,4)
GroupGofT_v0(s10, N);

subplot(4,2,5)
plotSpikeTrains_v1(s100, N, 500)

subplot(4,2,6)
GroupGofT_v0(s100, N);

subplot(4,2,7)
plot(strength, spike, 's')
axis([min(strength) max(strength) min(spike) max(spike)])

subplot(4,2,8)
plot(stds, means, 's')
axis([min(stds) max(stds) min(spike) max(spike)])
