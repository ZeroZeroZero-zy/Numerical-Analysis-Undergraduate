function [m,u,index]=pow(A,ep,N) 
%AΪ����epΪ����Ҫ��NΪ������������mΪ����ֵ��������ֵ��uΪ��Ӧ�������ֵ������������
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