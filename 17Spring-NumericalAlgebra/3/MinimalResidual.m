function [x,k]=MinimalResidual(A,b,x0,eps,N)
r0=b-A*x0;
r=r0;
k=1;
x=x0;
while norm(r)>=eps
    beta=dot(A*r,r)/dot(A*r,A*r);
    x=x+beta*r;
    r=r-beta*A*r;
    k=k+1;
    if k>=N
        disp('Warning: 迭代次数太多, 可能不收敛!');
        return;
    end
end