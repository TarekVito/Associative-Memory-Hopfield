function [ thresh, error ] = AMFindThres(Data,W)
ObjectiveFunction = @(x) AMGetError(x,Data,W);
x= 0;
[x, fval] = simulannealbnd(ObjectiveFunction,x);

end

