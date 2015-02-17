function [] = plotStimulations(data)

[l w] = size(data);
for i = 1:l,
    for j = 1:w,
        if data(i,j) > 0,
            hold on
            plot([data(i,j); data(i,j)], [i-0.5,i+0.5])
        end
    end
end

xlabel('Time (ms)')
ylabel('Neural ID')