function [root, ea, iter] = newton_raphson(func, xi, es, maxiter, varargin)
%Newton-Raphson Method
if nargin < 2, error('at least 2 arguments are needed'), end
if nargin < 3, es = 0.001; end
if nargin < 4, maxiter = 100; end

ea = 100; iter = 0; x = xi;
while(1)
    xold = x;
    x = x - (func(x, varargin{:}) / difference(func, x));
    ea = abs((x - xold) / x) * 100;
    iter = iter + 1;
    
    if ea < es || iter >= maxiter, break, end
    disp(iter);
end
root = x;
end

function result = difference(func, x)
    result = (func(x) - func(x - 0.0001)) / 0.0001;
end