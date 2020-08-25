% INPUT:
%       - filename
%       - x
%       - order
%       - continuity

function [] = create_geometry_opt (filename, x, order, continuity)
    [nrb_opt, knts, ptcs_vac, ptcs_el] = create_nrb_opt_electrode (order);

    % alternative (run7)
    % if (order > 8)
    %     % [x_opt]
    %     load('result_nlopt_order=8_run5.mat');
    %     nrb_opt = move_ctrl_opt (nrb_opt, x_opt);
    %     nrb_opt = nrbdegelev(nrb_opt, order-8);
    % end

    if (order > 8)
        % [x_opt]
        load('result_nlopt_order=8_run6.mat');
        nrb_opt = move_ctrl_opt (nrb_opt, x_opt);
        nrb_opt = nrbdegelev(nrb_opt, 1);
    end

    if (order > 9)
        % [x_opt]
        load('result_nlopt_order=9_run6.mat');
        nrb_opt = move_ctrl_opt (nrb_opt, x_opt);
        nrb_opt = nrbdegelev(nrb_opt, 1);
    end

    if (order > 10)
        % [x_opt]
        load('result_nlopt_order=10_run6.mat');
        nrb_opt = move_ctrl_opt (nrb_opt, x_opt);
        nrb_opt = nrbdegelev(nrb_opt, order-10);
    end

    if (continuity == order-1)
        nrb_opt = nrbkntins(nrb_opt, [1/2]);
    end

    nrb_opt = move_ctrl_opt (nrb_opt, x);

    crv = cut_nrb_opt (nrb_opt, order, knts, ptcs_vac, continuity);

    [ptcs_vac, ptcs_el] = create_ptcs_opt (ptcs_vac, ptcs_el, order, crv, continuity);

    write_geometryfile_opt (ptcs_vac, ptcs_el, filename);
end
