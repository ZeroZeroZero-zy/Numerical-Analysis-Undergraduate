function [z,lambda,k]=RQIMethod(A,z0,lambda,eps)
n=size(A,1);
y=(A-lambda*eye(n))\z0;
[g,l]=max(abs(y));
m=y(l);
z=y/m;
lambda=dot(z,A*z)/dot(z,z);
lambda1=0;
k=1;
while norm(lambda-lambda1)>=eps
    lambda1=lambda;
    k=k+1;
    y=(A-lambda*eye(n))\z;
    [g,l]=max(abs(y));
    m=y(l);
    z=y/m;
    lambda=dot(z,A*z)/dot(z,z);
end