function XISI = getXISI(spikeTrain, simTime, numNeurons)

%{
    This function will determine the value of the X-ISI function for all
    neurons.

    Max Henderson
    Drexel University
    April 1st, 2013
%}
XISI = zeros(simTime, numNeurons);
count = 2;
for i = 1:numNeurons,
    for t = 1:simTime,
        if spikeTrain(1,i) > t,
            XISI(t,i) = spikeTrain(1,i);
        elseif t >= max(spikeTrain(:,i)),
            XISI(t,i) = simTime - max(spikeTrain(:,i));
        else
            if spikeTrain(count,i) > t,
                XISI(t,i) = spikeTrain(count,i) - spikeTrain(count-1,i);
            else
               count = count + 1;
               XISI(t,i) = spikeTrain(count,i) - spikeTrain(count-1,i);
            end
        end
    end
    count = 2;
end