function [] = plot_bounds (lb, ub, filename, order, x)
    nrb_opt = create_nrb_opt_electrode (order);

    if (order > 8)
        nrb_opt = nrbdegelev(nrb_opt, order-8);
    end

    nrb_opt = move_ctrl_opt (nrb_opt, x);

    ctrl    = nrb_opt.coefs ./ nrb_opt.coefs(4,:);
    write_ctrl_opt (order, x);

    % 18
    ictrl = 2;
    ix    = 1;
    hold on;
    plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
    plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
    hold off;

    % 17
    ictrl += 1;
    ioff  = 2;
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

    if (order == 9 || order == 11)
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
end
