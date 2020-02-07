function [L]=Cholesky(A)
n=size(A,1);
L=zeros(n);
for j=1:n
    l1=0;
    for k=1:j-1
        l1=l1+L(j,k)^2;
    end
    L(j,j)=(A(j,j)-l1)^(1/2);
    for i=j+1:n
        ll=0;
        for k=1:j-1
            ll=ll+L(i,k)*L(j,k);
        end
        L(i,j)=(A(i,j)-ll)/L(j,j);
    end
end