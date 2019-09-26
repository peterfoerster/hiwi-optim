function [V] = computeV_connector (geometry, istart, iend)
   % corner points of connection to insulator
   z_s = nrbeval(geometry(istart).nurbs, [1 0]);
   z_e = nrbeval(geometry(iend).nurbs, [0 1]);
   r_i = z_s(2);
   r_o = z_e(2);
   h   = z_e(1) - z_s(1);

   V = pi*(r_o^2-r_i^2)*h;
end
