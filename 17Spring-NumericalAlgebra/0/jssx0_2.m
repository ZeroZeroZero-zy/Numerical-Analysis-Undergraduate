clc;
clear;

fprintf('  n      x       pn(x)       deviation\n');

n=1;
x=Taylor0_2(n,0.1);
fprintf('%3d     0.1   %4.4d    %4.4d\n',n,x,exp(0.1)-x);
x=Taylor0_2(n,0.2);
fprintf('%3d     0.2   %4.4d    %4.4d\n',n,x,exp(0.2)-x);
x=Taylor0_2(n,0.5);
fprintf('%3d     0.5   %4.4d    %4.4d\n',n,x,exp(0.5)-x);
x=Taylor0_2(n,1);
fprintf('%3d     1.0   %6d        %d\n',n,x,exp(1)-x);

n=2;
x=Taylor0_2(n,0.1);
fprintf('%3d     0.1   %4.4d    %4.4d\n',n,x,exp(0.1)-x);
x=Taylor0_2(n,0.2);
fprintf('%3d     0.2   %4.4d    %4.4d\n',n,x,exp(0.2)-x);
x=Taylor0_2(n,0.5);
fprintf('%3d     0.5   %4.4d    %4.4d\n',n,x,exp(0.5)-x);
x=Taylor0_2(n,1);
fprintf('%3d     1.0   %6d  %d\n',n,x,exp(1)-x);

n=3;
x=Taylor0_2(n,0.1);
fprintf('%3d     0.1   %4.4d    %4.4d\n',n,x,exp(0.1)-x);
x=Taylor0_2(n,0.2);
fprintf('%3d     0.2   %4.4d    %4.4d\n',n,x,exp(0.2)-x);
x=Taylor0_2(n,0.5);
fprintf('%3d     0.5   %4.4d    %4.4d\n',n,x,exp(0.5)-x);
x=Taylor0_2(n,1);
fprintf('%3d     1.0   %6d  %d\n',n,x,exp(1)-x);

n=5;
x=Taylor0_2(n,0.1);
fprintf('%3d     0.1   %4.4d    %4.4d\n',n,x,exp(0.1)-x);
x=Taylor0_2(n,0.2);
fprintf('%3d     0.2   %4.4d    %4.4d\n',n,x,exp(0.2)-x);
x=Taylor0_2(n,0.5);
fprintf('%3d     0.5   %4.4d    %4.4d\n',n,x,exp(0.5)-x);
x=Taylor0_2(n,1);
fprintf('%3d     1.0   %6d  %d\n',n,x,exp(1)-x);

n=10;
x=Taylor0_2(n,0.1);
fprintf('%3d     0.1   %4.4d    %4.4d\n',n,x,exp(0.1)-x);
x=Taylor0_2(n,0.2);
fprintf('%3d     0.2   %4.4d    %4.4d\n',n,x,exp(0.2)-x);
x=Taylor0_2(n,0.5);
fprintf('%3d     0.5   %4.4d    %4.4d\n',n,x,exp(0.5)-x);
x=Taylor0_2(n,1);
fprintf('%3d     1.0   %6d  %d\n',n,x,exp(1)-x);

n=20;
x=Taylor0_2(n,0.1);
fprintf('%3d     0.1   %4.4d    %4.4d\n',n,x,exp(0.1)-x);
x=Taylor0_2(n,0.2);
fprintf('%3d     0.2   %4.4d    %4.4d\n',n,x,exp(0.2)-x);
x=Taylor0_2(n,0.5);
fprintf('%3d     0.5   %4.4d    %4.4d\n',n,x,exp(0.5)-x);
x=Taylor0_2(n,1);
fprintf('%3d     1.0   %6d  %d\n',n,x,exp(1)-x);

n=100;
x=Taylor0_2(n,0.1);
fprintf('%3d     0.1   %4.4d    %4.4d\n',n,x,exp(0.1)-x);
x=Taylor0_2(n,0.2);
fprintf('%3d     0.2   %4.4d    %4.4d\n',n,x,exp(0.2)-x);
x=Taylor0_2(n,0.5);
fprintf('%3d     0.5   %4.4d    %4.4d\n',n,x,exp(0.5)-x);
x=Taylor0_2(n,1);
fprintf('%3d     1.0   %6d  %d\n',n,x,exp(1)-x);