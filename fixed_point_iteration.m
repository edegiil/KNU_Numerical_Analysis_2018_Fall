function [root, ea, iter] = fixed_point_iteration(func, xi, es, maxiter, varargin)
%fixed point iteration
if nargin < 2, error('at least 2 arguments needed'), end
if nargin < 3, es = 0.001; end
if nargin < 4, maxiter = 100; end

func_changed = func
ea = 100; iter = 0;
