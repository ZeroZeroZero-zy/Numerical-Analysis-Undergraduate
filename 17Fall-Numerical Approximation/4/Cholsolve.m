function [X]=Cholsolve(A,B)
%�ⷽ����A*X=B
n=size(A,1);
L=Cholesky(A);   %��÷ֽ�A=L*L'
Y=zeros(n,1);
for i=1:n
    Y(i)=(B(i)-L(i,1:i-1)*Y(1:i-1))/L(i,i);   %��LY=B���õ�Y
end
X=zeros(n,1);
C=L';
for i=n:-1:1
    X(i)=(Y(i)-C(i,i+1:n)*X(i+1:n))/C(i,i);   %��L'*X=Y,�õ�X
end
end