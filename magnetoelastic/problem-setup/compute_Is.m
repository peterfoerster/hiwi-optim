function [f] = compute_Is (x, y, iptc, coils)
   % compute homogeneous current densities
   Ab_coil = (coils.bur(1)-coils.bll(1))*(coils.bur(2)-coils.bll(2));
   jb = - coils.current/Ab_coil;
   At_coil = (coils.tur(1)-coils.tll(1))*(coils.tur(2)-coils.tll(2));
   jt = coils.current/At_coil;

   % evaluate current densities depending on the patch, seems to be working correctly
   switch (iptc)
      % upper coil
      case {4}
% keyboard;
         xl = x > coils.tll(1);
         xr = x < coils.tur(1);
         yb = y > coils.tll(2);
         yt = y < coils.tur(2);
         idx_coil = (xl&xr&yb&yt);
         f = zeros(size(x)) + jt*idx_coil;
      % lower coil
      case {6}
         xl = x > coils.bll(1);
         xr = x < coils.bur(1);
         yb = y > coils.bll(2);
         yt = y < coils.bur(2);
         idx_coil = (xl&xr&yb&yt);
         f = zeros(size(x)) + jb*idx_coil;
      otherwise
         f = zeros(size(x));
   end%switch
   f
end
