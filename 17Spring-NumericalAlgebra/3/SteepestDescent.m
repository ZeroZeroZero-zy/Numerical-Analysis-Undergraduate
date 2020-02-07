function [x,k]=SteepestDescent(A,b,x0,eps,N)
r0=b-A*x0;
r=r0;
k=1;
x=x0;
while norm(r)>=eps
    alpha=dot(r,r)/dot(A*r,r);
    x=x+alpha*r;
    r=r-alpha*A*r;
    k=k+1;
    if k>=N
        disp('Warning: 迭代次数太多, 可能不收敛!');
        return;
    end
end