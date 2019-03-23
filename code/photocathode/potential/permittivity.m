function [c_diff] = permittivity (ip, x, y)
switch (ip)
  % insulator patches
case {8, 10}
    c_diff = 9.4 * 8.854e-12*ones(size(x));
  otherwise
    c_diff = 8.854e-12*ones(size(x));
end%switch
end
