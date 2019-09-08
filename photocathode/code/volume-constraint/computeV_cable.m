function [V] = computeV_cable (geometry)
% corner points of cable connection
z_s = nrbeval(geometry(22).nurbs, [0 0]);
z_e = nrbeval(geometry(22).nurbs, [1 0]);
r   = z_e(2);
h   = z_e(1) - z_s(1);

V = pi*r^2*h;
end
