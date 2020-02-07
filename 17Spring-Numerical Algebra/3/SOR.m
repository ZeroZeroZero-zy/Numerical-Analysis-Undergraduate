function [x,k]=SOR(A,b,x0,eps,N,omega)
D=diag(diag(A));
U=-triu(A,1);
L=-tril(A,-1);
Lo=(D-omega*L)\((1-omega)*D+omega*U);
x=Lo*x0+omega*((D-omega*L)\b);
x1=x0;
k=1;
while norm(x-x1)>=eps
    x1=x;
    x=Lo*x1+omega*((D-omega*L)\b);
    k=k+1;
    if k>=N
        disp('Warning: 迭代次数太多, 可能不收敛!');
        return;
    end
end