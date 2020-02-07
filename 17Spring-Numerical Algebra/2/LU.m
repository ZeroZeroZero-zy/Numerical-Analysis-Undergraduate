function [L,U]=LU(A)
n=size(A,1);;
for i=1:n
    for k=i:n
        A(i,k)=A(i,k)-A(k,1:(i-1))*A(1:(i-1),i);
    end
    for j=i+1:n
        A(i,j)=(A(i,j)-L(i,1:(i-1))*A(1:(i-1),j))/A(i,i);
    end
end
L()
U
        