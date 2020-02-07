function [z,m,k]=PowerMethod(A,z0,eps)
y=A*z0;
[g,l]=max(abs(y));
m=y(l);
z=y/m;
k=1;
m1=0;
while norm(m-m1)>=eps
    m1=m;
    k=k+1;
    y=A*z;
    [g,l]=max(abs(y));
    m=y(l);
    z=y/m;
end