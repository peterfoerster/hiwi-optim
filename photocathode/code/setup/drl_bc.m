function [h] = drl_bc (ib, x, y, v_el, v_ar)
   switch (ib)
      % electrode
      case {1}
         h = v_el*ones(size(x));
      % anode ring
      case {2}
         h = v_ar*ones(size(x));
      % vacuumchamber
      case {3}
         h = zeros(size(x));
      otherwise
         error('unknown boundary');
   end%switch
end
