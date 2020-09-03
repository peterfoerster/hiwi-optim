% INPUT:
%       - lb:
%       - ub:
%       - order
%       - x
%       - continuity

function [] = plot_bounds (lb, ub, order, x, continuity)
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

    if (continuity <= order-1)
        % [x_opt]
        load('result_nlopt_order=8_run6.mat');
        nrb_opt = move_ctrl_opt (nrb_opt, x_opt);
        nrb_opt = nrbkntins(nrb_opt, [1/2]);
    end

    if (continuity == order-2)
        % [x_opt]
        load('result_nlopt_order=8_continuity=7_run6.mat');
        nrb_opt = move_ctrl_opt (nrb_opt, x_opt);
        nrb_opt = nrbkntins(nrb_opt, [1/4 3/4]);
    end

    nrb_opt = move_ctrl_opt (nrb_opt, x);

    ctrl = nrb_opt.coefs ./ nrb_opt.coefs(4,:);
    write_ctrl_opt (order, x, continuity);

    % 18
    ictrl = 2;
    ioff  = 0;
    ix    = ioff + 1;
    hold on;
    plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
    hold off;

    if (continuity == order-2)
        ictrl += 1;
        ioff  += 2;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
    end

    % 17
    ictrl += 1;
    ioff  += 2;
    ix    = ioff + 1;
    hold on;
    plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
    hold off;

    if (order >= 10)
        ictrl += 1;
        ioff  += 2;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
    end

    % 16
    ictrl += 1;
    ioff  += 2;
    ix    = ioff + 1;
    hold on;
    plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
    hold off;

    if (order == 9 || order == 11 || continuity == order-1)
        ictrl += 1;
        ioff  += 2;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
    end

    % 15
    if (order >= 10)
        ictrl += 1;
        ioff  += 2;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
    end

    ictrl += 1;
    ioff  += 2;
    ix    = ioff + 1;
    hold on;
    plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
    hold off;

    % 14
    ictrl += 1;
    ioff  += 2;
    ix = ioff + 1;
    hold on;
    plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
    hold off;

    if (continuity == order-2)
        ictrl += 1;
        ioff  = 2;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
    end
end
