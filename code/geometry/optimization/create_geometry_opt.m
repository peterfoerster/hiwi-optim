function [] = create_geometry_opt (filename, x, order)
    electrode       = create_electrode_v6();
    anode_ring      = create_anodering_v6();
    inner_insulator = create_innerinsulator_v6();
    outer_insulator = create_outerinsulator_v6();
    vacuumchamber   = create_vacuumchamber_v6 (electrode, anode_ring, inner_insulator, outer_insulator);
    domain_vac      = discretize_vacuumchamber_v6 (electrode, anode_ring, inner_insulator, outer_insulator, vacuumchamber);
    domain_el       = discretize_electrode_v6 (electrode);

   [ptcs_vac, ptcs_el] = create_ptcs_v6 (electrode, anode_ring, inner_insulator, outer_insulator, ...
                                         vacuumchamber, domain_vac, domain_el);

   [nrb_opt, knts] = create_nrb_opt_electrode (ptcs_vac, order);

   nrb_opt = move_ctrl_opt (nrb_opt, x, order);
   crv     = cut_nrb_opt (nrb_opt, order, knts);

   [ptcs_vac, ptcs_el] = create_ptcs_opt (ptcs_vac, ptcs_el, order, crv);

   write_geometryfile_opt (ptcs_vac, ptcs_el, filename, order);
end
