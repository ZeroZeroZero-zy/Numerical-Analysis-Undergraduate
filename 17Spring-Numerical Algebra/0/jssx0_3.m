clc;
clear;
%求解
A=72702.20727;
[B]=tentotwo0_3(72702);
[C]=tentotwo0_3_2(0.20727);
fprintf('answer =\n\n')
fprintf('%c',B)
fprintf('.')
fprintf('%c',C)
fprintf('\n')
%验证
B0=dec2bin(fix(A))