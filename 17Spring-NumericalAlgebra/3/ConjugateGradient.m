function [x,k]=ConjugateGradient(A,b,x0,eps,N)
r0=b-A*x0;
p=r0;
r=r0;
k=1;
x=x0;
while norm(r)>=eps
    alpha=dot(r,p)/dot(A*p,p);
    x=x+alpha*p;
    r=r-alpha*A*p;
    beta=-dot(r,A*p)/dot(p,A*p);
    p=r+beta*p;
    k=k+1;
    if k>=N
        disp('Warning: 迭代次数太多, 可能不收敛!');
        return;
    end
end