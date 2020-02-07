function [L,U]=LU2(A)
n=size(A,1);
L=eye(n,n);
U=zeros(n,n);
U(1,1:n)=A(1,1:n);
L(1:n,1)=A(1:n,1)/U(1,1);
for i=1:n-1
    if det(A(1:i,1:i))==0
       error('Input Matrix cannot be decomposed.');
    end
end
    
for i=1:n
    for k=i:n 
        lu1=0;
        for j=1:i-1
            lu1=lu1+L(i,j)*U(j,k);
        end
        U(i,k)=A(i,k)-lu1;
    end
    for k=i+1:n
        lu2=0;
        for j=1:i-1
            lu2=lu2+L(k,j)*U(j,i);
        end
        L(k,i)=(A(k,i)-lu2)/U(i,i);
    end
end
end   