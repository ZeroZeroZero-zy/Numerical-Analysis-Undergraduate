clc;
clear;

I0=0.6321;
fprintf(' n    In\n');
fprintf('%2d  %f\n',0,I0);
I=I0;
for i=1:20
    I=1-i*I;
    fprintf('%2d  %f\n',i,I);
end

disp(' ');

I20=128;
fprintf(' n    In\n');
fprintf('%2d  %f\n',20,I20);
I=I20;
for i=20:-1:1
    I=(1-I)/i;
    fprintf('%2d  %f\n',i-1,I);
end