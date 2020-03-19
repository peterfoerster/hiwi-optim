geometry_file = 'photocathode_200kV_v3';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);
degree = [2 2];
nsub   = [2 2];
np     = 32;

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

V_vac   = computeV_vac (geometry, 35, 14);
V_ptc   = computeV_cyl_mp (msh);
V_con   = computeV_connector (geometry, 29, 39);
V_hole  = computeV_hole (geometry, np, 17, 39);
V_lift  = computeV_lift (geometry, 37, 37);
V_cable = computeV_cable (geometry, 36, 36);

V_tot = V_vac - V_ptc - V_con - 2*V_hole - V_lift - V_cable;
V_tot*1e6
