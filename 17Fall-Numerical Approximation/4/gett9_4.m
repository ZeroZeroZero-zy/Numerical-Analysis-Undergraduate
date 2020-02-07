function [t]=gett9_4(N)
delta=5/N;
t=zeros(2*N+1,1);
for k=-N:N
    t(k+N+1)=k*delta;
end
end