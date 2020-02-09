function u=Ritz_Galerkin(PHI,f)
% 这个程序用来求解李荣华26页（新版）例题Ritz-Galerkin问题。
% 书上解法的调用方式：
% syms x;
% PHI=sym('[x*(1-x),x^2*(1-x)]');
% f=-x;
% Ritz_Galerkin(PHI,f)
% 得到书上的结果：
% ans =
% - (7*x^2*(x - 1))/41 - (71*x*(x - 1))/369
% 当然，还可以用更高维的逼近空间，例如三维，把PHI定义成
% PHI=sym('[x*(1-x),x^2*(1-x),x^3*(1-x)]');
% 再调用，就行了。
l_p=length(PHI); % 得到基函数的维数,以定义矩阵维数.
for i=1:l_p
    for j=1:l_p
        auv=-diff(PHI(i))*diff(PHI(j))+PHI(i)*PHI(j); %变分形式.
        AUV=int(auv);         % 对变分形式符号积分.
        AUV=inline(AUV);      % 把符号函数转化为数值函数才能计算其值.有其它办法吗?
        A(i,j)=AUV(1)-AUV(0); % 计算从0到1的积分值.AUV是积分得到的原函数.
    end
    auv=-diff(PHI(i))*diff(f)+PHI(i)*f; %以下四行参见如上注释.
    AUV=int(auv);
    AUV=inline(AUV);
    B(i)=AUV(1)-AUV(0);
end
B=B';
A=sym(A);B=sym(B); % 原来的程序没有这两行，导致了数值计算，而非符号,误差更大.
C=A\B;             % matlab代数方程解法.
u=PHI*C;           % 最终用符号表示微分方程的解.