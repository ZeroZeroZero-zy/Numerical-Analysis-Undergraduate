function [phi]=getphi2_2(n)
syms x;
phi=sym(zeros(n,1));
for i=1:n
    phi(i)=sin(i*pi*x);
end
end