function [c] = Galerkin(p, q, f, a, b, n)

%从GALERKIN法出发,用线性元求解边值问题

syms x

A = zeros(n, n);

B = zeros(n, 1);

h = (b - a) / n;

A(1, 1) = quadgk(matlabFunction(p(a+h*x)/h + h * q(a+h*x) * x^2),0,1,'RelTol',1e-8,'AbsTol',1e-12) + ...
 quadgk(matlabFunction(p(a+h+h*x)/h+h*q(a+h+h*x)*(1 - x)^2),0,1,'RelTol',1e-8,'AbsTol',1e-12);

A(1, 2) = quadgk(matlabFunction(-1*p(a+h+h*x)/h + h*q(a+h+h*x)*(1 - x)*x),0,1,'RelTol',1e-8,'AbsTol',1e-12);

for j = 2:n - 1

   A(j, j-1) = quadgk(matlabFunction(-1*p(a+(j - 1)*h+h*x)/h + h*q(a+(j - 1)*h+h*x)*(1 - x)*x),0,1,'RelTol',1e-8,'AbsTol',1e-12);

   A(j, j) = quadgk(matlabFunction(p(a+(j - 1)*h+h*x)/h + h*q(a+(j - 1)*h+h*x)*x^2),0,1,'RelTol',1e-8,'AbsTol',1e-12) + ...
       quadgk(matlabFunction(p(a+h*j+h*x)/h + h*q(a+h*j+h*x)*(1 - x)^2),0,1,'RelTol',1e-8,'AbsTol',1e-12);

   A(j, j+1) = quadgk(matlabFunction(-1*p(a+j*h+h*x)/h + h*q(a+j*h+h*x)*x*(1 - x)),0,1,'RelTol',1e-8,'AbsTol',1e-12);

end

A(n, n-1) = quadgk(matlabFunction(-1*p(b-h+h*x)/h + h*q(b-h+h*x)*x*(1 - x)),0,1,'RelTol',1e-8,'AbsTol',1e-12);

A(n, n) = quadgk(matlabFunction(p(b-h+h*x)/h + h*q(b-h+h*x)*x^2),0,1,'RelTol',1e-8,'AbsTol',1e-12);

 

for j = 1:n

    B(j) = h * quadgk(matlabFunction(f(a+(j - 1)*h+h*x)*x),0,1,'RelTol',1e-8,'AbsTol',1e-12) + ...
       h * quadgk(matlabFunction(f(a+j*h+h*x)*(1 - x)),0,1,'RelTol',1e-8,'AbsTol',1e-12);

end

c = A \ B;