function [c_diff] = permittivity_example (ip, x, y)
  switch (ip)
    % insulator patches
    case {2}
      c_diff = 100*ones(size(x));
    otherwise
      c_diff = 1*ones(size(x));
  end%switch
end
