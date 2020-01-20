function [nu22] = compute_nu22 (x, y, iptc)
   switch (iptc)
      case {5}
         % test with pure iron
         % nu22 = 1/(14872*pi*4e-7) * ones(size(x));
         % anisotropic
         nu22 = (1/1.012e-6) * ones(size(x));
      otherwise
         nu22 = 1/(pi*4e-7) * ones(size(x));
   end%switch
end
