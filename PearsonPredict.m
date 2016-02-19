function [ res] = PearsonPredict( vec,N, Data)
usersSize = size(vec,1);
res= zeros(size(vec));
for k=1:usersSize
    sim = ones(size(Data,1),1);

    for i=1:size(Data,1)
        sim(i) = PearsonSim(Data(i,:),vec(k,:));
    end
    [~, Idx] = sort(sim);
    Idx = flipud(Idx);  
    NUsers = Data(Idx(1:N),:);
    res(k,:) = double(mean(NUsers,1)>0);
end
res(res==0) = -1;
end