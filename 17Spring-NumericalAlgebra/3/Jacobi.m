function [x,j]=Jacobi(A,b,x0,eps,N)
D=diag(diag(A));
U=-triu(A,1);
L=-tril(A,-1);
x=x0;
for j=1:N
    t=x;
    x=D^-1*(L+U)*x+D^-1*b;
    if norm(t-x)<=eps
        break
    end
    if j==N
        disp(' ');
        disp('迭代次数过多，可能不收敛！');
    end
end