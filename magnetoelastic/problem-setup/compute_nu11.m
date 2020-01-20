function [nu11] = compute_nu11 (x, y, iptc)
   switch (iptc)
      case {5}
         % test with pure iron
         % nu11 = 1/(14872*pi*4e-7) * ones(size(x));
         % anisotropic
         nu11 = (1/3.77e-6) * ones(size(x));
      otherwise
         nu11 = 1/(pi*4e-7) * ones(size(x));
   end%switch
end
