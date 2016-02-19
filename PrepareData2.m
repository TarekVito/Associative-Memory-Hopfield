%function [TestIn,TestRes,DataSet] = PrepareData2()
csvData = csvread('ratings.csv');
sz = size(unique(csvData(:,1)),1);
v = size(sz,1);
for i=1:sz
v(i) = sum(csvData(:,1)==i);
if mod(i,1000)==0 
   i 
end
end

[~, idx] = sort(v);
idx = fliplr(idx);

users = idx(1:1000)';
uniqM = unique(csvData(ismember(csvData(:,1),users),2));
movieMap(uniqM) = 1:size(uniqM,1);
userMap(users) = 1:size(users,1);
usersSize = size(users,1);
uniqAllMSize = size(uniqM,1);
Data = ones(usersSize,uniqAllMSize)*-1;
for i=1:usersSize
    userIdx= users(i);
    userData = csvData(csvData(:,1)==userIdx,:);
    userUniqM = unique(userData(:,2));
    uniqMS = size(userUniqM,1);
    meanUser = mean(userData(:,3));
    for j=1:uniqMS
        
        Data(userMap(userIdx),movieMap(userUniqM(j))) = userData(userData(:,2)==userUniqM(j),3)>meanUser;
        
    end
    if mod(i,100)==0 
        i 
    end
end
tmpRnd = 1:usersSize;
for i=1:100000
    a = floor(1+rand(1)*(usersSize-1));b = floor(1+rand(1)*(usersSize-1));
    tmp = tmpRnd(a);
    tmpRnd(a)= tmpRnd(b);
    tmpRnd(b) = tmp;
end
%Data(Data==0) = -1;
DataRnd = Data(tmpRnd,:);
TestIn = DataRnd(1:floor(usersSize/5),:);
TestRes = DataRnd(1:floor(usersSize/5),:);
for i=1:size(TestIn,1)
    curUser = TestIn(i,:);
    %userOnes = find(curUser==1);
    %oneIdx = userOnes(unique(1+round(rand(floor(size(userOnes,2)/10),1)*(size(userOnes,2)-1))));
    %curUser(oneIdx)=0;
    
    curUser(tmpRnd) = -1+round(rand(size(tmpRnd)))*2;
    TestIn(i,:) = reshape(curUser,[1,size(curUser,2)]);
end
DataSet = DataRnd(floor(usersSize/5)+1:usersSize,:);

%end
