clear all; clf; clc
pkg load geopdes;
geometry_file = 'photocathode_200kV_test';
N_inc = 2;
% vectorize the input, 2 inputs per point if its allowed to move in u and v
% N_ptc  = 6;
% % total number of DOFs
% N_ctrl = N_ptc*(N_inc+2)*2 - 2*(N_ptc-1) - 6
N_ctrl = 12*N_inc+8;
% ix1 = 10*N_inc+9;
% ix2 = 2*(N_inc+1)-4;

x = zeros(N_ctrl,1);

% test individual control points
% x(1) = 0.005;

[iptcs, ibnds] = move_geo_ctrl (geometry_file, N_inc, x);
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

for ii=1:length(iptcs)
   hold on;
   nrbctrlplot(geometry(iptcs(ii)).boundary(ibnds(ii)).nurbs);
   hold off;
end
