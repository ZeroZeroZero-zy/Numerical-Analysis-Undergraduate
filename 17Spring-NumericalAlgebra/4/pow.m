function [m,u,index]=pow(A,ep,N) 
%A为矩阵；ep为精度要求；N为最大迭代次数；m为绝对值最大的特征值；u为对应最大特征值的特征向量。
N=100;
ep=1e-6; 
n=length(A);
u=ones(n,1);
index=0;k=0;
m1=0; 
while k<=N       
    v=A*u;
    m=max(abs(v));
    u=v/m;     
    if abs(m-m1)<ep 
        index=1;
        break; 
    end
    m1=m;
    k=k+1;
end