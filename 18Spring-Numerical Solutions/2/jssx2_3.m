clc
clear
close all

syms x y;
f=1;
phi=(1-x^2)*(1-y^2)*[1 x^2 y^2 x^4 x^2*y^2 y^4]';
phi1=(1-x^2)*(1-y^2)*[1 x^2 y^2 x^4 x^2*y^2 y^4 ...
        x^6 x^4*y^2 x^2*y^4 y^6]';

[u]=RG_method2_3(f,phi);
[u1]=RG_method2_3(f,phi1);

figure('Name','2-3')
subplot(2,1,1);
fmesh(u,[-1 1]);
title('n=6')
subplot(2,1,2);
fmesh(u1,[-1 1]);
title('n=10')
suptitle('≤¥À…∑Ω≥Ã')