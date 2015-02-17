function MFP = simplifyMFP(mfp, simTime)

numSteps = floor(length(mfp)/simTime);
count = 1;
currentStep = 1;
MFP = zeros(simTime,1);
for i = 1:length(mfp)-1,
    MFP(count) = MFP(count) + mfp(i);
    currentStep = currentStep + 1;
    if currentStep > numSteps,
        MFP(count) = MFP(count)/numSteps;
        count = count + 1;
        currentStep = 1;
    end
end