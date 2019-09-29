function [h] = volume_constraint(x, order)
   geometry_file = ['photocathode_200kV_optim_order=' num2str(order)];
   create_photocathode_optim (geometry_file, x, order);
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

   V_tot = computeV_total (geometry, msh, np);
   % 625 cm^3 as maximum volume
   h = 625 - V_tot;
end
