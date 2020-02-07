clc;
clear;

A=[5 7;7 10];
b=[0.7;1];
b1=[0.69;1.01];
[Q,R]=qr(A);
x=QRsolve1_1(Q,R,b)
x1=QRsolve1_1(Q,R,b1)

deltax=x-x1
deltab=b-b1
condA=(norm(deltax)/norm(x))/(norm(deltab)/norm(b));
Ani=condA/norm(A);
fprintf('condA >= %d\n\n',condA);
fprintf('||A^-1|| >= %d\n',Ani);