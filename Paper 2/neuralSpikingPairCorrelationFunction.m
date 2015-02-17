function g = neuralSpikingPairCorrelationFunction(spikes, numNeurons, dt)

%{
    This function will be used to determine a pair correlation function
    between neural firings!  In this program, we treat time t as distance r
    in a normal g(r) function, so g(r) -> g(t).  

    Max Henderson
    Drexel University
%}

%% Sort action potentials by time while keeping neuronal ID.
spikes = reshape(spikes, numNeurons, numNeurons);
orderedSpikes = zeros(2,2);
count = 1;
for i = 1:numNeurons,
    for j = 1:numNeurons,
        if spikes(i,j) > 0,
            orderedSpikes(count,1) = spikes(i,j);
            orderedSpikes(count,2) = j;
            count = count + 1;
        end
    end
end
orderedSpikes = sort(orderedSpikes,1);

%% Account for periodic boundary conditions and set constants.
startIndex = length(orderedSpikes);
orderedSpikes = [orderedSpikes; (orderedSpikes+500); (orderedSpikes+1000)];
maxT = 250;

%% Calculate g(t) for the spike train data.
g = zeros(100,1);
for i = startIndex+1:startIndex+startIndex,
    t = 1;
    count = 1;
    while t < maxT,
        a = orderedSpikes(:,1) < orderedSpikes(i,1) + t + dt;
        b = orderedSpikes(:,1) > orderedSpikes(i,1) + t - dt;
        c = orderedSpikes(:,2) ~= orderedSpikes(i,2);
        d = a + b + c;
        g(count) = sum(d==3);
        count = count + 1;
        t = t + dt;
    end
end
g = g/startIndex;
plot(linspace(1,maxT,count-1), g(1:count-1))
        