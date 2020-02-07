function [pr,pii,fr,fi]=kkfft(pr,pii,fr,fi,n,k,l,il)
for i=0:n-1
    m=i;
    is=0;
    for ii=0:k-1
        j=fix(m/2);
        is=2*is+(m-2*j);
        m=j;
    end
    fr(i+1)=pr(is+1);
    fi(i+1)=pii(is+1);
end
pr(1)=1;
pii(1)=0;
p=2*pi/n;
pr(2)=cos(p);
pii(2)=-sin(p);
if l~=0
    pii(2)=-pii(2);
end
for i=2:n-1
    p=pr(i)*pr(2);
    q=pii(i)*pii(2);
    s=(pr(i)+pii(i))*(pr(2)+pii(2));
    pr(i+1)=p-q; 
    pii(i+1)=s-p-q;
end
for i=0:2:n-2
    vr=fr(i+1);
    vi=fi(i+1);
    fr(i+1)=vr+fr(i+2);
    fi(i+1)=vi+fi(i+2);
    fr(i+2)=vr-fr(i+2);
    fi(i+2)=vi-fi(i+2);
end
m1=fix(n/2);
nv=2;
for l0=k-2:-1:0
    m1=fix(m1/2);
    nv=2*nv;
    for it=0:nv:(m1-1)*nv
        for j=0:nv/2-1
             p=pr(m1*j+1)*fr(it+j+nv/2+1);
             q=pii(m1*j+1)*fi(it+j+nv/2+1);
             s=pr(m1*j+1)+pii(m1*j+1);
             s=s*(fr(it+j+nv/2+1)+fi(it+j+nv/2+1));
             poddr=p-q; 
             poddi=s-p-q;
             fr(it+j+nv/2+1)=fr(it+j+1)-poddr;
             fi(it+j+nv/2+1)=fi(it+j+1)-poddi;
             fr(it+j+1)=fr(it+j+1)+poddr;
             fi(it+j+1)=fi(it+j+1)+poddi;
        end
    end
end
if l~=0
    for i=0:n-1
        fr(i+1)=fr(i+1)/n;
        fi(i+1)=fi(i+1)/n;
    end
end
if il~=0
    for i=0:n-1
        pr(i+1)=sqrt(fr(i+1)^2+fi(i+1)^2);
        if abs(fr(i+1))<1e-6*abs(fi(i+1))
            if fi(i+1)*fr(i+1)>0
                pii(i+1)=90;
            else
                pii(i+1)=-90;
            end
        else
            pii(i+1)=atan(fi(i+1)/fr(i+1))*360/(2*pi);
        end
    end
end
end