function [V_full , V] = computeV_lift (np)
r   = 13e-3;
h_1 = 7e-3;
h_2 = 4e-3;
h_3 = 49e-3;
% volume of full cylinder
r_full = 20e-3;
V_full = pi*r_full^2*(h_1+h_2+h_3);
V_cyl  = pi*r^2 * (h_1+h_2);

x   = 7.5e-3;
phi = acos(x/r);
x   = [r*(1-sin(phi)) r];
y   = @(x) sqrt(r^2 - x^2);

[qp, qw] = grule(np);
qw_x     = diff(x)/2*qw;
qp_x     = diff(x)/2*(qp+1) + x(1);

A = 0;
for ix=1:length(qp_x)
  Iy   = [0 y(qp_x(ix))];
  qw_y = diff(Iy)/2*qw;
  A    = A + qw_x(ix)*sum(qw_y);
end

V = V_cyl + 4*A*h_3;
end
