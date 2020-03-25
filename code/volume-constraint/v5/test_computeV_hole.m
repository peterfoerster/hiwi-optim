geometry_file = 'photocathode_200kV_v3';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

np      = 32;
ihole   = 17;
iinside = 39;
V = computeV_hole(geometry, np, ihole, iinside);
V*1e6

x1 = nrbeval(geometry(17).nurbs, [0 0]);
x2 = nrbeval(geometry(17).nurbs, [1 0]);
r = (x2(1)-x1(1))/2;
y_i = nrbeval(geometry(39).nurbs, [0.5 1]);

V_testa = pi*r^2*(x1(2)-y_i(2))*1e6
V_testb = pi*r^2*(x2(2)-y_i(2))*1e6
