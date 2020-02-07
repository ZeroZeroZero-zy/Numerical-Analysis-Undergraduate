function [A]=getA2_3(n)
a1=9*ones(n-1,1);
A1=diag(a1,-1);
a2=3*ones(n,1);
A2=diag(a2);
a3=ones(n-1,1);
A3=diag(a3,1);
A=A1+A2+A3;
