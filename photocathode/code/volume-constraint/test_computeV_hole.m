clear all; close all; clc;

geometry_file = 'photocathode_200kV';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

np = 20;
V = computeV_hole(geometry, np);
return
% seperate test
nurbs = nrbsquare([0 0], 2, 1);

% physical coordinates
z_s = nrbeval(nurbs, [0 0]);
z_e = nrbeval(nurbs, [1 0]);
r   = (z_e(1) - z_s(1))/2;
Iz  = [-r r];

% inner radius
y_i = nrbeval(nurbs, [0.5 0]);

[qp, qw] = grule(np);
qp_n     = 1/2*(qp+1);

qw_z     = diff(Iz)/2*qw;
qp_z     = diff(Iz)/2*(qp+1) + Iz(1);

V = 0;
for iz=1:length(qp_z)
  y  = nrbeval(nurbs, [qp_n(iz) 1]);
  % sine scaled to full period on [0 1]
  % y  = [0 1+sin(2*pi*qp_n(iz))];
  Iy = [y_i(2) y(2)];
  x  = sqrt(r^2 - qp_z(iz)^2);
  Ix = [0 x];

  qw_x     = diff(Ix)/2*qw;
  qw_y     = diff(Iy)/2*qw;
  [wx, wy] = meshgrid(qw_x, qw_y);

  V = V + qw_z(iz)*sum(sum(wx.*wy));
end

V = 2*V;
