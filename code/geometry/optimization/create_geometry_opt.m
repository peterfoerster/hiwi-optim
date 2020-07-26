function [] = create_geometry_opt (filename, x, order)
    [nrb_opt, knts, ptcs_vac, ptcs_el] = create_nrb_opt_electrode (order);

    if (order > 8)
        % [x_opt]
        load('result_nlopt_order=8_run5.mat');
        nrb_opt = move_ctrl_opt (nrb_opt, x_opt);
        nrb_opt = nrbdegelev(nrb_opt, order-8);
    end

    nrb_opt = move_ctrl_opt (nrb_opt, x);
    crv     = cut_nrb_opt (nrb_opt, order, knts, ptcs_vac);

    [ptcs_vac, ptcs_el] = create_ptcs_opt (ptcs_vac, ptcs_el, order, crv);

    write_geometryfile_opt (ptcs_vac, ptcs_el, filename);
end
