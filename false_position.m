function [root, ea, iter] = false_position(func, xl, xu, es, maxiter, varargin)
%false position
if func(xl, varargin{:}) * func(xu, varargin{:}) > 0, error('no sign changes'), end
if nargin < 3, error('at least 3 arguments are needed'), end
if nargin < 4, es = 0.001; end
if nargin < 5, maxiter = 50; end

iter = 0; ea = 100; xr = xu
while(1)
   xrold = xr;
   xr = xu - (func(xu, varargin{:}) * (xl - xu) / (func(xl, varargin{:}) - func(xu, varargin{:})));
   if func(xr) > 0
       xu = xr;
   elseif func(xr) < 0
       xl = xr;
   else
       root = xr;
       break
   end
   iter = iter + 1;
   ea = abs((xr - xrold) / xr) * 100;
   if iter >= maxiter || ea < es
       break
   end
   disp(iter);
end

root = xr;
    