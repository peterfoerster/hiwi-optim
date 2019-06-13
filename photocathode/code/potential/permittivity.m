function [c_diff] = permittivity (ip, x, y, geometry_file)
  switch (ip)
  % 10 insulator, kink
    case {10}
      c_diff = 9.4 * 8.854e-12*ones(size(x));
    case {7}
      ic = (y < 35e-3);
      c_diff = 8.854e-12 * (ones(size(x)) + 8.4*ic);
    case {8}
      ic = (y > 25e-3);
      c_diff = 8.854e-12 * (ones(size(x)) + 8.4*ic);
    otherwise
      c_diff = 8.854e-12*ones(size(x));
  end%switch
end
