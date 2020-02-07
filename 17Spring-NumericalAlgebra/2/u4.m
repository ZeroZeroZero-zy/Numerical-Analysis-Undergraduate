function [L,U]=LU2(A)

A=[2 4 -2;1 -1 5;4 1 -2]

n=size(A,1);
L=eye(n,n);
U=zeros(n,n);  
for i=1:n
    for k=i:n
        for j=1:i-1
            U(i,k)=A(i,k)-L(i,j)*U(j,k);
        end
    end
    for k=i+1:n
        for j=1:i-1
            L(k,i)=(A(k,i)-L(k,j)*U(j,i))/U(i,i);
        end
    end
end
L
U
for t=1:n
    U(1:t,t)=A(1:t,t);
end
for t=2:n
    L(t,1:t-1)=A(t,1:t-1);
end

    