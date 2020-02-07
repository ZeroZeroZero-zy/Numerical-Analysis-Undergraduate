function [B]=ni(L)
m=size(L,1);
B=zeros(m);
for s=1:m
    B(s,s)=1/L(s,s);
end
for t=1:m-1
    for k=t+1:m
        lb=0;
        for i=1:k-1
            lb=lb+L(k,i)*B(i,t);
        end
        B(k,t)=-lb/L(k,k);
    end
end
end