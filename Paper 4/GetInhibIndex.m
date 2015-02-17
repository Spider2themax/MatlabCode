function inhibIndex = GetInhibIndex(data)

%{
    This program will be used to connect the neurons in our model using
    various methods which will be outlined later more specifically.

    Max Henderson
    May 19, 2014
    Drexel University
%}

inhibIndex = 0; % Index for switching from exc. to inh. neurons
count = 1;
while (inhibIndex == 0):
    if data(count, 1) == -1,
        inhibIndex = count;
    else
        count = count + 1;
    end
end