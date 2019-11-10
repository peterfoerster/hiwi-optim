function [] = create_photocathode_optim (filename, x, order)
   electrode_boundary   = create_electrodeboundary_v4();
   vacuumchamber        = create_vacuumchamber_v4 (electrode_boundary);
   vacuumchamber_inside = divide_vacuumchamber_v4 (electrode_boundary, vacuumchamber);
   ptcs                 = create_ptcs_v4 (electrode_boundary, vacuumchamber, vacuumchamber_inside);

   [nrb_optim, knts] = create_nrb_optim (ptcs, order);
   nrb_optim         = move_ctrl_optim (nrb_optim, x, order);
   crv               = cut_nrb_optim (nrb_optim, order, knts);
   ptcs              = create_ptcs_optim (ptcs, x, order, crv);
   write_geometryfile_v4 (ptcs, [filename '.txt']);
end
