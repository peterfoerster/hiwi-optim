nurbs = nrbsquare([0 0], 1, 1);
% nurbs = nrbextrude(nurbs, [0 0 3.48]);
nrbplot(nurbs, [10 10]);
degree = [2 2];
nsub   = [2 2];

geometry   = geo_load(nurbs);
regularity = degree-1;
nquad      = degree+1;
[knots, zeta] = kntrefine (geometry.nurbs.knots, nsub-1, degree, regularity);
rule          = msh_gauss_nodes (nquad);
[qn, qw]      = msh_set_quad_nodes (zeta, rule);
msh           = msh_cartesian (zeta, qn, qw, geometry);

% [A] = computeS_ptc (msh)
[V] = computeV_cyl_ptc (msh)
