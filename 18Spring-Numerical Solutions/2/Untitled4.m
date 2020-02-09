syms x y c1 c2 c3 c4 c5 c6
omega=(1-x^2)*(1-y^2);
phi0=c1*1;
phi1=c2*x^2+c3*y^2;
phi2=c4*x^4+c5*x^2*y^2+c6*y^4;
f=sym(1);

un=omega*(phi0+phi1+phi2);
h=diff(un,x)^2+diff(un,y)^2;

d1=diff(h,c1);

PHI=omega*[1 x^2 y^2 x^4 x^2*y^2 y^4];

C=[c1 c2 c3 c4 c5 c6];
hh=sym(0);
for i=1:6
    hh=hh+(diff(PHI(i),x)*diff(PHI(1),x)+diff(PHI(i),y)*diff(PHI(1),y))*C(i);
end