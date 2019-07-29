geometry_file = 'photocathode_200kV_lift';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

degree = [4 4];
nsub = [8 8];

regularity = degree-1;
nquad = degree+1;
npatch = numel (geometry);
msh = cell (1, npatch);
sp = cell (1, npatch);

for iptc=1:npatch
  [knots{iptc}, zeta{iptc}] = kntrefine (geometry(iptc).nurbs.knots, nsub-1, degree, regularity);
  rule      = msh_gauss_nodes (nquad);
  [qn, qw]  = msh_set_quad_nodes (zeta{iptc}, rule);
  msh{iptc} = msh_cartesian (zeta{iptc}, qn, qw, geometry(iptc));
  sp{iptc} = sp_bspline (knots{iptc}, degree, msh{iptc});
end
msh = msh_multipatch (msh, boundaries);
space = sp_multipatch (sp, msh, interfaces, boundary_interfaces);
clear sp;

% patch 8 and 9 form a rectangle of area: (30x10)*1e-6, works!
% [A] = compute_surface_ptc (msh.msh_patch{8}, space.sp_patch{8});
% [A] = A + compute_surface_ptc (msh.msh_patch{9}, space.sp_patch{9})
% test_A = 30*10e-6

[A] = compute_surface_mp (space, msh)
