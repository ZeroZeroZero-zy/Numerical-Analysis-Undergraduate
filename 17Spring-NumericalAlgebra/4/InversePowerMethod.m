function [z,lambda,k]=InversePowerMethod(A,z0,lambda_i,eps)
n=size(A,1);
y=(A-lambda_i*eye(n))\z0;
[g,l]=max(abs(y));
m=y(l);
z=y/m;
lambda1=0;
lambda=lambda_i;
k=1;
while norm(lambda-lambda1)>=eps
    lambda1=lambda;
    k=k+1;
    y=(A-lambda_i*eye(n))\z;
    [g,l]=max(abs(y));
    m=y(l);
    z=y/m;
    lambda=lambda_i+1/m;
end