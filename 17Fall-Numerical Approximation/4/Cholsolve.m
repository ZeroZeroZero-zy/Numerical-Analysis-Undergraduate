function [X]=Cholsolve(A,B)
%解方程组A*X=B
n=size(A,1);
L=Cholesky(A);   %求得分解A=L*L'
Y=zeros(n,1);
for i=1:n
    Y(i)=(B(i)-L(i,1:i-1)*Y(1:i-1))/L(i,i);   %解LY=B，得到Y
end
X=zeros(n,1);
C=L';
for i=n:-1:1
    X(i)=(Y(i)-C(i,i+1:n)*X(i+1:n))/C(i,i);   %解L'*X=Y,得到X
end
end