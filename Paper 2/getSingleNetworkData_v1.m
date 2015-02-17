function []  = getSingleNetworkData_v1(currentDir, numNeurons, numCon, moveDir)

%{
    In this program, we get data from spike train information for a single
    neural network ran at different coupling strengths.
%}

str = [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;30; 40; 50; 100];
%stims = [0;0.001;0.002;0.003;0.004;0.005;0.006;0.007;0.008;0.009;0.01;0.011;0.012;0.013;0.014;0.015;0.016;0.017;0.018;0.019;0.02;0.03; 0.04; 0.05; 0.1];
for i = 1:numCon,
    for k = 1:25,
        for j = 1:1,
            spikeCount = sprintf('%d', i);
            curStr = sprintf('%d',str(k));
            %stim = num2str(stims(k));
            run = sprintf('%d', j);
            if k == 1,
                getSimulationData(numNeurons, currentDir, spikeCount, '0', run, moveDir)
            else
                getSimulationData(numNeurons, currentDir, spikeCount, curStr, run, moveDir)
            end
            %moveStimulationData(currentDir, spikeCount, stim, run, moveDir);
        end
    end
end