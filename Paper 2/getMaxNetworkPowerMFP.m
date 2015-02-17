function rates = getMaxNetworkPowerMFP(dir, numNeurons, numCon)

rates = zeros(25,1);
strength = [0;1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;30;40;50;100];
for i = 1:numCon,
    for str = 1:25,
        for j = 1:1,
            spikeCount = sprintf('%d', i);  
            curStr = sprintf('%d', strength(str));
            run = sprintf('%d', j);
            file_potentials = strcat(dir,'/MFP', spikeCount, 'Strength', curStr, 'Run', run, '.txt');
            try
                mfp = single(textread( file_potentials , '%f',-1,'commentstyle','shell'));
                mfp =  mfp(length(mfp)/5:length(mfp)*4/5);
                power = powerSpectrumNeuralNetworkMFP(mfp, length(mfp));
                rates(str,1) = max(power) + rates(str,1);  
            catch
                disp('whoops!') 
            end
        end
    end
end
rates = rates/numCon;
%% Plot firing rates over different realizations.
strengths = linspace(0,1,21);
%plot(strengths, rates)
%xlabel('g (siemens)')
%ylabel('Max power')