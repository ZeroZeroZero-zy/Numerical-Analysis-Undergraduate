function [C]=ni2(U)
m=size(U,1);
C=eye(m,m);
for i=1:m
    C(i,i)=1/U(i,i);
end
for t=1:m-1
    for k=t+1:m
        lc=0;
        for i=1:k-1
            lc=lc+U(i,k)*C(t,i);
        end
        C(t,k)=-lc/U(k,k);
    end
end
end