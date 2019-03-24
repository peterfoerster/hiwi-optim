function [c_diff] = permittivity (ip, x, y, geometry_file)
if (strcmp(geometry_file), 'photocathode_plain')
  switch (ip)
  % 9 plain
  case {9}
    c_diff = 9.4 * 8.854e-12*ones(size(x));
  otherwise
    c_diff = 8.854e-12*ones(size(x));
  end%switch
else
  switch (ip)
  % 10 insulator, kink
case {10}
    c_diff = 9.4 * 8.854e-12*ones(size(x));
  otherwise
    c_diff = 8.854e-12*ones(size(x));
  end%switch
end%if
end
