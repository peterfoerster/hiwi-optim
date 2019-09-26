clear all; close all; clc;

geometry_file = 'photocathode_200kV_v3';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);
degree = [2 2];
nsub   = [8 8];
np     = 20;

regularity = degree-1;
nquad      = degree+1;
npatch     = numel (geometry);
msh        = cell (1, npatch);
sp         = cell (1, npatch);

for iptc=1:npatch
   [knots{iptc}, zeta{iptc}] = kntrefine (geometry(iptc).nurbs.knots, nsub-1, degree, regularity);
   rule                      = msh_gauss_nodes (nquad);
   [qn, qw]                  = msh_set_quad_nodes (zeta{iptc}, rule);
   msh{iptc}                 = msh_cartesian (zeta{iptc}, qn, qw, geometry(iptc));
end
msh = msh_multipatch (msh, boundaries);

V_vac            = computeV_vac (geometry);
V_ptc            = computeV_cyl_mp (msh);
V_hole           = computeV_hole_v1 (geometry, np);
V_lift           = computeV_lift (geometry);
[V_cable]        = computeV_cable (geometry);
[V_con]  = computeV_connector (geometry);

V_tot = V_vac - V_ptc - V_con - 2*V_hole - V_lift - V_cable;
V_tot*1e6
