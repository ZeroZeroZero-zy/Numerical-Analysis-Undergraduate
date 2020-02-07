function [V,D,k]=BasicalQR4_3(A,eps)
n=size(A,1);
[Q,R]=QR4_3(A);
A1=A;
A=R*Q;
V=Q;
k=1;
while norm(A-A1)>=eps
    [Q,R]=QR4_3(A);
    A1=A;
    A=R*Q;
    V=V*Q;
    k=k+1;
end
D=A;
end