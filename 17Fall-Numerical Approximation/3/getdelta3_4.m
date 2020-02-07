function [d]=getdelta3_4(f,g,a,b)
F=matlabFunction(simplify(abs(f-g)));
x0=a:1e-4:b;
d=max(F(x0));
end