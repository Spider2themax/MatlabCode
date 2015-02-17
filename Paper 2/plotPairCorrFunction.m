function [] = plotPairCorrFunction(spikeTrain, numNeurons, simTime, n1, n2, n3, n4, ylabelyes, xticlabelyes)

%{
    This function will visualize spike trains of neural networks.
%}

%% Set up plot parameters.
s = spikeTrain;
N = numNeurons;
spikes = reshape(s, N, N);
spikeTrain = spikeTrain';

%% Calculate all to all spike differences.
tDiff = zeros(2,1);
count = 1;
doneIn = 1;
doneOut = 1;
time1 = 1;
time2 = 1;
for neuron1 = 1 : N - 1,
    for neuron2 = neuron1 : N,
        while doneOut == 1,
            if (spikes(time1, neuron1)) == 0,
                doneOut = 0;
            else
                while doneIn == 1,
                    if (spikes(time2, neuron2)) == 0,
                        doneIn = 0;
                    else
                        tDiff(count) = abs(spikes(time1, neuron1) - (spikes(time2, neuron2)));
                        count = count + 1;
                        time2 = time2 + 1;
                    end
                end
                doneIn = 1;
                time2 = 1;
                time1 = time1 + 1;
            end
        end
        doneIn = 1;
        doneOut = 1;
        time2 = 1;
        time1 = 1;
    end
end

y = hist(tDiff, 500);
%Scale y
for i = 1:500,
    y(i) = y(i)/(500 - i + 1);
end
y = y/sum(y);
x = linspace(1,500,500);

% dummy axes for the box and background color
ax0 = axes('Position', [n1, n2, n3, n4]);
plot(x,y, 'k', 'LineWidth', 2)
set (ax0, 'Box', 'on', 'Color', 'white', 'XTick', [], 'YTick', []);

% first axes for left y-axis
ax1 = axes ('Position', get (ax0, 'Position'));
set (ax1, 'Box', 'off', 'Color', 'none', 'YAxisLocation', 'left', 'LineWidth',2,'FontSize',20, 'FontName', 'Arial', 'FontWeight', 'bold')
axis([0 simTime -min(y) max(y)])

if ylabelyes == 1,
    ylabel('g(t)', 'FontSize', 20, 'FontName','Arial', 'FontWeight', 'bold')
end
if xticlabelyes ~= 1,
    set(gca,'XTickLabel',[])
else
    xlabel('Time (ms)', 'FontSize', 20, 'FontName','Arial', 'FontWeight', 'bold')
end

% second axes for right y-axis assuming common x-axis controlled by ax1
ax2 = axes ('Position', get (ax0, 'Position'));
set (ax2, 'Box', 'off', 'Color', 'none', 'XTick', [], 'YAxisLocation', 'right', 'Ytick', []);
axis([0 simTime -min(y) max(y)])
