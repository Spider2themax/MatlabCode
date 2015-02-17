function fOfX = mfpSpikes(mfp)

%% Chop off beginning of mfp to get rid of 'bad' data.
mfp = mfp(4000:length(mfp));

%% Set mfp to new minimum.
mfp = mfp-min(mfp);

%% Adjust special function for evaluating.
fOfX = zeros(60,1);
for i = 1:length(mfp),
    x = ceil(mfp(i));
    fOfX(1:x) = fOfX(1:x) + 1;
end
fOfX = sum(fOfX);