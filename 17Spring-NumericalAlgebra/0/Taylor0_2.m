function [v]=Taylor0_2(n,x)
v=1/factorial(n);
for k=n:-1:1
    v=v*x+1/factorial(k-1);
end
end