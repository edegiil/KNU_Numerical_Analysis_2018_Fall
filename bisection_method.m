function [root, ea, iter] = bisection_method(func, xl, xu, es, maxit, varargin)
%bisection method
if func(xl, varargin{:}) * func(xu, varargin{:}) > 0, error('no sign changes'), end
if nargin < 3, error('at least 3 argument is neccessary'), end
if nargin < 4, es = 0.001; end
if nargin < 5, maxit = 50; end

iter = 0; ea = 100; xr = xl;
while(1)
    xrold = xr;
    xr = (xl + xu) / 2;
    if func(xr) < 0
        xl = xr;
    elseif func(xr) == 0, break
    else
        xu = xr;
    end
    iter = iter + 1;    
    ea = abs((xr - xrold) / xr) * 100;
    disp(iter);
    if iter > maxit || ea < es, break, end
end

root = xr;
end