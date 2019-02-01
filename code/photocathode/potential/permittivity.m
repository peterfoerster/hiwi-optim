function [c_diff] = permittivity (ip, x, y)
switch (ip)
  % insulator patches
  case {}
    c_diff
  otherwise
    c_diff = 8.854e-12*ones(size(x));
end%switch
end
