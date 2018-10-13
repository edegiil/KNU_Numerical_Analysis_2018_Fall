function brackets = incremental_search(func, xmin, xmax, dx);
% incremental_search
if nargin < 3, error('at least 3 argument is neccessary'), end
if nargin < 4, dx = 0.0001; end

x = xmin;
brackets = [];
nb = 0;

while(1)
    check = func(x) * func(x + dx);
    if check < 0
        nb = nb + 1;
        brackets(nb, 1) = x;
        brackets(nb, 2) = x + dx;
    end
    if x >= xmax, break, end
    x = x + dx;
end

fprintf('number of brackets : %d', nb);
end