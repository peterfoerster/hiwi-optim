function [h] = volume_constraint(x)
   geometry_file = 'photocathode_200kV_optim';
   N_inc = (length(x)-8)/12;
   [iptcs, ibnds] = move_geo_ctrl (geometry_file, N_inc, x);
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
   V_hole           = computeV_hole (geometry, np);
   [V_full ,V_lift] = computeV_lift (np);
   [V_cable]        = computeV_cable (geometry);

   V_tot = V_vac - V_ptc - 2*V_hole - V_full + V_lift - V_cable;
   V_tot = V_tot*1e6;
   h = 625 - V_tot;
end
