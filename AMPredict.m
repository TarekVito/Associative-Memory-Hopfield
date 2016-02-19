function [ CompletedA ] = AMPredict( W,user,thresh,hopField )
OldComp = ones(size(user))*2;
while(1==1)
    CompletedA = user*W;
    CompletedA = int32(CompletedA > thresh);
    CompletedA(CompletedA==0) = -1;
    if(sum(OldComp(:) ~= CompletedA(:))==0 || hopField == 0)
        break
    end
    OldComp=CompletedA;
end

end

