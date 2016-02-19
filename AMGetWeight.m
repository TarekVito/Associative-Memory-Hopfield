function [ weightMatrix ] = AMGetWeight(AllUsers)
tic
weightMatrix = zeros(size(AllUsers,2));
usersSize = size(AllUsers,1);
for i=1 :usersSize
    userV = AllUsers(i,:);
    weightMatrix =weightMatrix + userV'*userV;
    if mod(i,50)==0
        i
    end
end

weightMatrix = weightMatrix ./size(AllUsers,1);
toc
end


