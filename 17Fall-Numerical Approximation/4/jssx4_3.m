clc
clear

n=64;
k=6;
l1=0; %0为Fourier变换，1为逆变换
l2=1;
il=1;
pr=zeros(n,1);
pii=zeros(n,1);
fr=zeros(n,1);
fi=zeros(n,1);
for i=0:n-1
    pr(i+1)=exp(-0.1*(i+0.5));
end
disp('序列p')
for i=0:15
    for j=0:3
        fprintf('%13e   ',pr(4*i+j+1))
    end
    fprintf('\n')
end
[pr,pii,fr,fi]=kkfft(pr,pii,fr,fi,n,k,l1,il);
fprintf('\n')
disp('p的傅里叶变换f实部')
for i=0:15
    for j=0:3
        fprintf('%13e   ',fr(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('\n')
disp('p的傅里叶变换f虚部')
for i=0:15
    for j=0:3
        fprintf('%13e   ',fi(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('\n')
disp('p的傅里叶变换f模')
for i=0:15
    for j=0:3
        fprintf('%13e   ',pr(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('\n')
disp('p的傅里叶变换f俯角')
for i=0:15
    for j=0:3
        fprintf('%13e   ',pii(4*i+j+1))
    end
    fprintf('\n')
end
[fr,fi,pr,pii]=kkfft(fr,fi,pr,pii,n,k,l2,il);
fprintf('\n')
disp('f的傅里叶逆变换p模')
for i=0:15
    for j=0:3
        fprintf('%13e   ',fr(4*i+j+1))
    end
    fprintf('\n')
end
fprintf('\n')