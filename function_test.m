function [name, mean, stdev] = function_test(x)

name = input('name', 's');
disp(1&0);
n = length(x);
mean = sum(x)/n;
stdev = sqrt(sum((x - mean) .^2 / (n-1)));
end