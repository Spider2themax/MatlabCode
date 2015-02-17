function stims = interpretStims(data)

%{
    This function will interpret the data as a series of stimulations
    hitting the respective neurons in the network.

    Max Henderson
    Drexel University
    February 28, 2013
%}

stims = zeros(data(length(data)-1));
neuralID = 0;
time = 0;
count = 1;
for i = 1:length(data),
    if time == 0,
        if neuralID == data(i) + 1,
            count = count + 1;
        else 
            count = 1;
        end
        neuralID = data(i) + 1;
        time = 1;
    else
        stims(neuralID, count) = data(i);
        time = 0;
    end
end