function [V,D,k]=PracticalQR4_3(A,eps)
n=size(A,1);
[A,Q0]=Hessenberg(A);
B=A;
V=zeros(n);
[Q,R]=QR4_3(A);
A1=A;
A=R*Q;
k=1;
while norm(A-A1)>=eps
    [Q,R]=QR4_3(A);
    A1=A;
    A=R*Q;
    k=k+1;
end
D=A;
b=diag(D);
for i=1:n
    [V(:,i),g,h]=InversePowerMethod(B,ones(n,1),b(i),eps);
end
V=Q0*V;
end