function [xisi, count] = getXisi(spikeTrain, t, simTime, count)

%{
    This function will determine the value of the X-ISI function.  The
    X-ISI function is used to related to the interspike spike intervals,
    ISIs, between spikes for a signaling neuron.  Basically, X-ISI(t) will
    take the value of the current ISI for the neuron at time t.  For
    example, if neuron A fired spikes at 5, 15, and 30 ms, then X-ISI(7) =
    10 and X-ISI(20) = 15.

    Max Henderson
    Drexel University
    March 28th, 2013
%}
if t < spikeTrain(1),
    xisi = spikeTrain(1);
elseif t >= max(spikeTrain),
    xisi = simTime - max(spikeTrain);
else
    done = 0;
    while (done == 0) && (count <= length(spikeTrain)),
        if spikeTrain(count) > t,
            xisi = spikeTrain(count) - spikeTrain(count - 1);
            done = 1;
        else
            count = count + 1;
        end
    end
end
t
count
spikeTrain(count)