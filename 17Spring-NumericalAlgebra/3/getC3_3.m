function [C]=getC3_3(A,B)
n=size(A,1);
C=zeros(2*n);
C(1:n,1:n)=A;
C(1:n,n+1:2*n)=B;
C(n+1:2*n,1:n)=B;
C(n+1:2*n,n+1:2*n)=A;