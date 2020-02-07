function [fr,fi]=kkfft2(n,k,pr,pii,l,il)
fr=zeros(n,1);
fi=zeros(n,1);
for it=0:n-1
      m=it; is=0;
        for i=0:k-1
           j=m/2; is=2*is+(m-2*j); m=j;
        end
        fr(it+1)=pr(is+1); fi(it+1)=pii(is+1);
end
    pr(0+1)=1.0; pii(0+1)=0.0;
    p=6.283185306/(1.0*n);
    pr(1+1)=cos(p); pii(1+1)=-sin(p);
    if l~=0
        pii(1+1)=-pii(1+1);
    end
    for i=2:n-1
      p=pr(i-1+1)*pr(1+1); q=pii(i-1+1)*pii(1+1);
        s=(pr(i-1+1)+pii(i-1+1))*(pr(1+1)+pii(1+1));
        pr(i+1)=p-q; pii(i+1)=s-p-q;
    end
    for it=0:2:n-2
     vr=fr(it+1); vi=fi(it+1);
        fr(it+1)=vr+fr(it+1+1); fi(it+1)=vi+fi(it+1+1);
        fr(it+1+1)=vr-fr(it+1+1); fi(it+1+1)=vi-fi(it+1+1);
    end
    m=n/2; nv=2;
    for l0=k-2:-1:0
       m=m/2; nv=2*nv;
        for it=0:nv:(m-1)*nv
          for j=0:(nv/2)-1
             p=pr(m*j+1)*fr(it+j+nv/2+1);
              q=pii(m*j+1)*fi(it+j+nv/2+1);
              s=pr(m*j+1)+pii(m*j+1);
              s=s*(fr(it+j+nv/2+1)+fi(it+j+nv/2+1));
              poddr=p-q; poddi=s-p-q;
              fr(it+j+nv/2+1)=fr(it+j+1)-poddr;
              fi(it+j+nv/2+1)=fi(it+j+1)-poddi;
              fr(it+j+1)=fr(it+j+1)+poddr;
              fi(it+j+1)=fi(it+j+1)+poddi;
          end
        end
    end
    if l~=0
      for i=0:n-1
         fr(i+1)=fr(i+1)/(1.0*n);
          fi(i+1)=fi(i+1)/(1.0*n);
      end
    end
    if il~=0
      for i=0:n-1
        pr(i+1)=sqrt(fr(i+1)*fr(i+1)+fi(i+1)*fi(i+1));
          if (abs(fr(i+1))<0.000001*abs(fi(i+1)))
            if ((fi(i+1)*fr(i+1))>0) 
                pii(i+1)=90.0;
            else
                pii(i+1)=-90.0;
            end
          else
            pii(i+1)=atan(fi(i+1)/fr(i+1))*360.0/6.283185306;
          end
      end
    end
end