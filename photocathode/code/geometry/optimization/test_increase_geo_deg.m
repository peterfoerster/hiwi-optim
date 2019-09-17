clear all; close all; clc;

geometry_file = 'photocathode_200kV_test';
% need to elevate the degree of 11 and 14 as well for geopdes
N_inc = 4;
[iptcs, ibnds] = increase_geo_deg (geometry_file, N_inc);
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

for ii=1:length(iptcs)
   hold on;
   nrbctrlplot(geometry(iptcs(ii)).boundary(ibnds(ii)).nurbs);
   hold off;
end
