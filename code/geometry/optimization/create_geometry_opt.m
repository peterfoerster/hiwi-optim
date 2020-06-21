function [] = create_geometry_opt (filename, x, order)
    [nrb_opt, knts, ptcs_vac, ptcs_el] = create_nrb_opt_electrode (order);

    nrb_opt = move_ctrl_opt (nrb_opt, x);
    crv     = cut_nrb_opt (nrb_opt, order, knts, ptcs_vac);

    [ptcs_vac, ptcs_el] = create_ptcs_opt (ptcs_vac, ptcs_el, order, crv);

    write_geometryfile_opt (ptcs_vac, ptcs_el, filename);
end
