clc
clear

f=@(t)exp(-t.^2);
N=64;
t=gett9_4(N);
pr=f(t);
n=length(pr);
pii=zeros(n,1);
fr=zeros(n,1);
fi=zeros(n,1);
for i=0:31
    for j=0:3
        fprintf('%13e   ',pr(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('%13e   ',pr(129))
fprintf('\n\n')
[pr,pii,fr,fi]=kkfft(pr,pii,fr,fi,n,7,0,0);
disp('Fourier变换实部')
for i=0:31
    for j=0:3
        fprintf('%13e   ',fr(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('%13e   ',fr(129))
fprintf('\n\n')
disp('Fourier变换虚部')
for i=0:31
    for j=0:3
        fprintf('%13e   ',fi(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('%13e   ',fi(129))
fprintf('\n\n')

pr=f(t);
pii=zeros(n,1);
fr=zeros(n,1);
fi=zeros(n,1);
[pr,pii,fr,fi]=kkfft(pr,pii,fr,fi,n,7,1,0);
disp('Fourier逆变换实部')
for i=0:31
    for j=0:3
        fprintf('%13e   ',fr(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('%13e   ',fr(129))
fprintf('\n\n')
disp('Fourier逆变换虚部')
for i=0:31
    for j=0:3
        fprintf('%13e   ',fi(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('%13e   ',fi(129))
fprintf('\n\n')