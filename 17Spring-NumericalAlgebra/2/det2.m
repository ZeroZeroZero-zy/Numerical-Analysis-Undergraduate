function [d]=det2(A)
n=size(A,1);
d=1;
for i=1:n
    d=d*A(i,i);
end