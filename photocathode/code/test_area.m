geometry_file = 'photocathode_200kV_inside'; %_inside
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

degree = [2 2];
nsub   = [8 8];

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


% compute analytic solution
% r_i = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,0}, 0, geometry(1).rdim);
% r_o = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {1,1}, 0, geometry(1).rdim);
% h = r_o(1) - r_i(1);
% test_A = 2*pi*h * (r_o(2)-r_i(2))
%
% [A] = compute_surface_ptc (msh.msh_patch{1}, space.sp_patch{1})
%
% return
% test rectangle from 8,9
% r_i = geo_nurbs (geometry(8).nurbs, geometry(8).dnurbs, geometry(8).dnurbs2, {1,0}, 0, geometry(8).rdim);
%
% r_o = geo_nurbs (geometry(9).nurbs, geometry(9).dnurbs, geometry(9).dnurbs2, {1,1}, 0, geometry(9).rdim);
% h = r_o(1) - r_i(1);
% V_ref = pi*h * (r_o(2)-r_i(2))^2
%
% [A] = compute_surface_ptc (msh.msh_patch{9}, space.sp_patch{9})
% return
% [A] = compute_surface_ptc (msh.msh_patch{8}, space.sp_patch{8});
% V = 2*pi*(A_1+A_2)

% e_V = (V-V_ref)/V_ref

[A] = compute_surface_mp (space, msh)
return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% deprecated
% test quarter circle and rectangle from 7
ul = geo_nurbs (geometry(7).nurbs, geometry(7).dnurbs, geometry(7).dnurbs2, {0,1}, 0, geometry(7).rdim);
ll = geo_nurbs (geometry(7).nurbs, geometry(7).dnurbs, geometry(7).dnurbs2, {0,0}, 0, geometry(7).rdim);
ur = geo_nurbs (geometry(7).nurbs, geometry(7).dnurbs, geometry(7).dnurbs2, {1,1}, 0, geometry(7).rdim);

A_torus = pi/4*(ul(1)-ll(1))^2 * 2*pi*ul(2);
h = ur(1) - ll(1);
A_test = A_torus + 2*pi*h * (ur(2) - ll(2))
