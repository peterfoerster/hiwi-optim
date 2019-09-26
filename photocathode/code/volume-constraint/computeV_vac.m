function [V] = computeV_vac (geometry)
% corner points of vacuumchamber
z_s = nrbeval(geometry(35).nurbs, [0 0]);
z_e = nrbeval(geometry(14).nurbs, [1 1]);
r   = z_e(2) - z_s(2);
h   = z_e(1) - z_s(1);

V = pi*r^2*h;
end
