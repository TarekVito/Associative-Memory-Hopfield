function [distance] = PearsonSim(a,b)
aM = a - mean(a);
bM = b - mean(b);
aM2 = aM*aM';
bM2 = bM*bM';
abSum = aM*bM';

distance = abSum / (aM2*bM2);
end