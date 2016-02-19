function [ error acc] = AMGetError( thresh,DataIn,DataRes,W,hopField )
tic
res = AMPredict(W,DataIn,thresh,hopField);
toc
DataSize = size(DataIn,1);
error = zeros(DataSize,1);
acc = zeros(DataSize,1);
for i=1:DataSize
    diff = DataRes(i,:) ~= res(i,:);
    %InResDiff = DataRes(i,:) ~= DataIn(i,:);
    %error(i) = error(i) + norm(int32(diff & InResDiff));
    %acc(i) = acc(i) + (1 - sum(int32(diff & InResDiff))/sum(int32(InResDiff)));
    error(i) = error(i) + norm(double(diff));
    acc(i) = acc(i) + (1 - sum(int32(diff))/size(res,2));
end
error = sum(error)/DataSize;
acc = sum(acc)/DataSize;
end





