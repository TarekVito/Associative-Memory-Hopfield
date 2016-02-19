function [ error,acc] = PearsonGetError(DataSet,DataIn,DataRes,N)
tic
res = PearsonPredict(DataIn,N,DataSet);
toc
DataSize = size(DataIn,1);
error = zeros(DataSize,1);
acc = zeros(DataSize,1);
for i=1:DataSize
    diff = DataRes(i,:) ~= res(i,:);
    %InResDiff = DataRes(i,:) ~= DataIn(i,:);
    %error(i) = error(i) + norm(double(diff & InResDiff));
    %acc(i) = acc(i) + (1 - sum(double(diff & InResDiff))/sum(double(InResDiff)));
    error(i) = error(i) + norm(double(diff));
    acc(i) = acc(i) + (1 - sum(int32(diff))/size(res,2));
end
error = sum(error)/DataSize;
acc = sum(acc)/DataSize;
end

