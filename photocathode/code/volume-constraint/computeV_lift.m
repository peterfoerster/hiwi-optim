function [V] = computeV_lift (geometry, istart, iend)
   % corner points of lift
   z_s = nrbeval(geometry(istart).nurbs, [0 0]);
   z_e = nrbeval(geometry(iend).nurbs, [1 0]);
   r   = z_e(2);
   h   = z_e(1) - z_s(1);

   V = pi*r^2*h;
end
