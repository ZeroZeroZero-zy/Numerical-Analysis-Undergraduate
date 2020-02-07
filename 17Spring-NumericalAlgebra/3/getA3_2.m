function [A]=getA3_2(N)
A=zeros(N-1);
A(1,1)=2;
A(1,2)=-1;
for i=2:N-2
    A(i,i-1)=-1;
    A(i,i)=2;
    A(i,i+1)=-1;
end
A(N-1,N-2)=-1;
A(N-1,N-1)=2;