function [x] = Steepest(A,b,x,N)
x0=x;
r=b-A*x0;
k=1;

while norm(r)>=10^-6
    x0 = x;
    a=dot(r,r)/dot(A*r,r);
    x = x0+a*r;
    r=r-a*A*r;
    k = k+1;
    if k>=N
        disp('Warning: 迭代次数太多, 可能不收敛!');
        return;
    end
end
k