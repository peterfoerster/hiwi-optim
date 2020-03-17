function [V] = computeV_hole (geometry, np, ihole, iinside)
   % physical coordinates in beam direction
   z_s = nrbeval(geometry(ihole).nurbs, [0 0]);
   z_e = nrbeval(geometry(ihole).nurbs, [1 0]);
   r   = (z_e(1) - z_s(1))/2;
   Iz  = [-r r];

   % inner radius of electrode
   y_i = nrbeval(geometry(iinside).nurbs, [0.5 1]);

   [qp, qw] = grule(np);
   qp_n     = 1/2*(qp+1);

   qw_z     = diff(Iz)/2*qw;
   qp_z     = diff(Iz)/2*(qp+1) + Iz(1);

   V = 0;
   for iz=1:length(qp_z)
      y  = nrbeval(geometry(ihole).nurbs, [qp_n(iz) 0]);
      Iy = [y_i(2) y(2)];
      x  = sqrt(r^2 - qp_z(iz)^2);
      Ix = [0 x];

      qw_x     = diff(Ix)/2*qw;
      qw_y     = diff(Iy)/2*qw;
      [wx, wy] = meshgrid(qw_x, qw_y);

      V = V + qw_z(iz)*sum(sum(wx.*wy));
   end

   V = 2*V;
end
