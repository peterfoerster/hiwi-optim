function [h] = drl_bc (ib, x, y, voltage)
  switch (ib)
    % electrode
    case {1}
      h = voltage*ones(size(x));
      % vacuumchamber
    case {2}
      h = zeros(size(x));
    otherwise
      error('unknown boundary');
  end%switch
end
