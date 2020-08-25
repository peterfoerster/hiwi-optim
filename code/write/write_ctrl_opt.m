% INPUT:
%       - order:
%       - x:
%       - continuity

function [] = write_ctrl_opt (order, x, continuity)
    nrb_opt = create_nrb_opt_electrode (order);

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

    nsub = 100;
    % nrbctrlplot_dat(nrb_opt, nsub, ['nurbs_' num2str(iptcs(ii)) '_' num2str(ibnds(ii))]);
    nrbctrlplot(nrb_opt);
end
