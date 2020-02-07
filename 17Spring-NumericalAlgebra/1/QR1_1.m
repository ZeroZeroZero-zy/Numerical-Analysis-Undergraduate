function [Q,R]=QR1_1(A)
n=size(A,1);
Q=eye(n);
for i=1:n-1
    for j=i+1:n
        T=eye(n);
        c=A(i,i)/(A(i,i)^2+A(j,i)^2)^(1/2);
        s=A(j,i)/(A(i,i)^2+A(j,i)^2)^(1/2);
        T(i,i)=c;
        T(j,j)=c;
        T(i,j)=s;
        T(j,i)=-s;
        Q=T*Q;
        A=T*A;
    end
end
Q=Q';
R=A;