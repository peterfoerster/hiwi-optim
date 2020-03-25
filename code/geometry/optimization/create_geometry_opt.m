function [] = create_geometry_opt (filename, x, order)
   order=3;
   electrode       = create_electrode_v6();
   anode_ring      = create_anodering_v6();
   inner_insulator = create_innerinsulator_v6();
   outer_insulator = create_outerinsulator_v6();
   vacuumchamber   = create_vacuumchamber_v6 (anode_ring, electrode, inner_insulator, outer_insulator);
   domain_vac      = discretize_vacuumchamber_v6 (electrode, anode_ring, inner_insulator, outer_insulator, vacuumchamber);
   domain_el       = discretize_electrode_v6 (electrode);

   [ptcs_vac, ptcs_el] = create_ptcs_v6 (electrode, anode_ring, inner_insulator, outer_insulator, vacuumchamber, domain_vac, domain_el);

   [nrb_opt, knts] = create_nrb_opt_upperelectrode (ptcs_vac, order);
   [nrb_opt, knts] = create_nrb_opt_anodering (ptcs_vac, order);
   [nrb_opt, knts] = create_nrb_opt_frontelectrode (ptcs_vac, order);
return
   nrb_opt = move_ctrl_opt (nrb_opt, x, order);
   crv     = cut_nrb_opt (nrb_opt, order, knts);
   ptcs    = create_ptcs_opt (ptcs, order, crv);

   % also update electrode patches
   write_geometryfile_v6 (ptcs_vac, ptcs_el, filename);
end
