function [phi]=getphi2_1(n)
syms x;
phi=sym(zeros(n,1));
for i=1:n
    phi(i)=(1-x)*x^i;
end
end