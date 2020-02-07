function [z,r,k]=PowerMethodRayleigh(A,z0,eps)
y=A*z0;
[g,l]=max(abs(y));
m=y(l);
z=y/m;
k=1;
r=dot(z,A*z)/dot(z,z);
r1=0;
while norm(r-r1)>=eps
    r1=r;
    k=k+1;
    y=A*z;
    [g,l]=max(abs(y));
    m=y(l);
    z=y/m;
    r=dot(z,A*z)/dot(z,z);
end