function [y] = GroupGofT_v0(s, N)

%{ 

    Max Henderson
    Drexel University
    12/4/13
%}

%% Calculate all to all spike differences.
spikes = reshape(s, N, N);
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
plot(x,y)