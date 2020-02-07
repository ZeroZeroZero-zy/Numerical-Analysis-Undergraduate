clear
syms x xj1 xj xj_1 yj1 yj yj_1 hj hj1 mj1 mj mj_1

sx_j_1_j=yj_1*(1+2*(x-xj_1)/hj)*((x-xj)/hj)^2+...
       yj*(1+2*(xj-x)/hj)*((x-xj_1)/hj)^2+...
       mj_1*(x-xj_1)*((x-xj)/hj)^2+...
       mj*(x-xj)*((x-xj_1)/hj)^2;   %x在xj-1与xj间的s(x)
sx_j_1_j_2=simplify(diff(sx_j_1_j,x,2));

sx_j_j1=yj*(1+2*(x-xj)/hj1)*((x-xj1)/hj1)^2+...
       yj1*(1+2*(xj1-x)/hj1)*((x-xj)/hj1)^2+...
       mj*(x-xj)*((x-xj1)/hj1)^2+...
       mj1*(x-xj1)*((x-xj)/hj1)^2;   %x在xj与xj+1间的s(x)
sx_j_j1_2=simplify(diff(sx_j_j1,x,2));


sx_2_r=simplify(limit(sx_j_j1_2,x,xj)); %s(x)在xj处的右极限
sx_2_l=simplify(limit(sx_j_1_j_2,x,xj)); %s(x)在xj处的左极限

s=simplify(sx_2_r-sx_2_l)