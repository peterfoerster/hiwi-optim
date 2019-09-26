function [V] = computeV_puck (geometry)
% corner points of front part of puck
z_s = nrbeval(geometry(37).nurbs, [1 0]);
z_e = nrbeval(geometry(3).nurbs, [0 1]);
r = z_e(2);
h = z_e(1) - z_s(1);

V = pi*r^2*h;
end
