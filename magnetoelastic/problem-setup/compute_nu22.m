function [nu22] = compute_nu22 (x, y, iptc)
   switch (ip)
      case {5}
         nu22 = (1/1.012e-6) * ones(size(x));
      otherwise
         nu22 = 1/(pi*4e-7) * ones(size(x));
   end%switch
end
