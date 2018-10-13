function [root, ea, iter] = secant_method(func, xi, xn, es, maxiter, varargin)
%Secant Method
if nargin < 3, error('at least 3 arguments are required'), end
if nargin < 4, es = 0.0001; end
if nargin < 5, maxiter = 100; end

ea = 100; iter = 0; x = xi; xnext = xn;
while(1)
   xold = x;
   x = xnext;
   xnext = x - (func(x, varargin{:}) .* (xold - x) / (func(xold, varargin{:}) - func(x, varargin{:})));
   
   ea = abs((x - xold)/x) * 100;
   iter = iter + 1;
   disp(iter);
   if ea < es || iter >= maxiter, break, end
end
root = x;
end