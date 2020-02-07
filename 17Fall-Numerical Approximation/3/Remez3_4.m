function [P]=Remez3_4(f,a,b,n,eps)
x0=getx_Remez(a,b,n);
[P0,mu]=getnewP(x0,f);
mu1=mu;
x1=getnewx(x0,a,b,f,P0);
[P,mu]=getnewP(x1,f);
if norm(mu)>=norm(mu1)&&norm(mu1)<=eps
    P=P0;
    return
end
k=1;
while norm(mu1-mu)>=eps
    mu1=mu;
    x1=getnewx(x1,a,b,f,P);
    [P,mu]=getnewP(x1,f);
    k=k+1;
end
end