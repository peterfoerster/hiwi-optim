clear all; clf; clc
pkg load geopdes;
geometry_file = 'photocathode_200kV_test';
N_inc = 2;
% total number of DOFs
N_ctrl = 12*N_inc+8;
x = zeros(N_ctrl,1);

% test individual control points
x(32) = 0.005;
tic;
[iptcs, ibnds] = move_geo_ctrl (geometry_file, N_inc, x);
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);
toc;
% for ii=1:length(iptcs)
%    hold on;
%    nrbctrlplot(geometry(iptcs(ii)).boundary(ibnds(ii)).nurbs);
%    hold off;
% end

for ii=1:length(geometry)
   hold on;
   nrbkntplot(geometry(ii).nurbs);
   hold off;
end
