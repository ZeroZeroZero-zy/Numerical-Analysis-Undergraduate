function [x,k]=GaussSeidel3(A,B,b,x0,eps,N)
n=size(A,1);
C=getC3_3(A,B);
L=zeros(2*n);
U=zeros(2*n);
U(1:n,n+1:2*n)=-C(1:n,n+1:2*n);
L(n+1:2*n,1:n)=-C(n+1:2*n,1:n);
D=zeros(2*n);
D(1:n,1:n)=A;
D(n+1:2*n,n+1:2*n)=A;
x=(D-L)\U*x0+(D-L)\b;
x1=x0;
k=1;
while norm(x-x1)>=eps
    x1=x;
    x=(D-L)\U*x1+(D-L)\b;
    k=k+1;
    if k>=N
        disp('Warning: 迭代次数太多, 可能不收敛!');
        return;
    end
end
end