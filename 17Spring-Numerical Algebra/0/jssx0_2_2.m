clc;
clear;

n=[1;2;3;5;10;20;100];
x=[0.1;0.2;0.5;1];

fprintf('  n       x          pn(x)         deviation\n');
for i=1:7
    n0=n(i);
    for j=1:4
        x0=x(j);
        pnx=Taylor0_2(n0,x0);
        fprintf('%3d   %3f   %12d    %12d\n',n0,x0,pnx,exp(x0)-pnx);
    end
end