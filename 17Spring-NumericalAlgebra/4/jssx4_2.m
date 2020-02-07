clc;
clear;
% ‰»Î
A=[0 11 -5;-2 17 -7;-4 26 -10];
lambda=4.2613;
z0=[1 1 1]';
eps=1e-6;
%«ÛΩ‚
[z_IPM,lambda_IPM,k_IPM]=InversePowerMethod(A,z0,lambda,eps)
[z_RQIM,lambda_RQIM,k_RQIM]=RQIMethod(A,z0,lambda,eps)