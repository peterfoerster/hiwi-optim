geometry_file = 'photocathode_insulator';
  [geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

  degree     = [4 4];
  % degree-1
  regularity = [3 3];
  % to be determined by convergence study
  nsub       = [1 1];
  % degree+1
  nquad      = [5 5];

  npatch = numel (geometry);
  msh = cell (1, npatch);
  sp = cell (1, npatch);

  load ('nsub=128.mat');

  % recreate msh and space
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

  iptc = 8;
  % {1 1} and {1 0} are the triple points
  % also {1 1} for patch 10
  sp_eval(u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {1 1}, 'gradient')
