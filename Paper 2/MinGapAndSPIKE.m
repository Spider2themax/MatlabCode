function [results] = MinGapAndSPIKE(data)

[l w] = size(data);
results = zeros(w, 2);
gaps = [0; 0.001; 0.002; 0.003; 0.004; 0.005; 0.006; 0.007; 0.008; 0.009; 0.010; 0.011; 0.012; 0.013; 0.014; 0.015; 0.016; 0.017; 0.018; 0.019; 0.02; 0.03; 0.04; 0.05; 0.1];
for i = 1:w,
    [C,I] = min(data(:,i));
    results(i,1) = gaps(I);
    results(i,2) = C;
end