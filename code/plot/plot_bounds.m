function [] = plot_bounds (lb, ub, filename, order, x)
    nrb_opt = create_nrb_opt_electrode (order);
    ctrl    = nrb_opt.coefs ./ nrb_opt.coefs(4,:);
    write_ctrl_opt (order, x);

    if (order < 8)
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
        ictrl = 3;
        ioff  = 2;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 16
        ioff = 4;
        for ictrl=4:order+1
            ix = ioff + 2*ictrl-7;
            hold on;
            plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
            plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
            plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
            plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
            hold off;
        end

        % 15
        ictrl = order+2;
        ioff  = 4 + 2*(order-2);
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 14
        ictrl = order+3;
        ioff  = 6 + 2*(order-2);
        ix = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
    elseif (order >= 8)
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
        ictrl = 3;
        ioff  = 2;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 16
        ictrl = 4;
        ioff  = 4;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 15
        ictrl = 5;
        ioff  = 6;
        ix    = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 14
        ictrl = 6;
        ioff  = 8;
        ix = ioff + 1;
        hold on;
        plot([ctrl(1,ictrl)+lb(ix) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)+ub(ix)], [ctrl(2,ictrl) ctrl(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl)+lb(ix+1) ctrl(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([ctrl(1,ictrl) ctrl(1,ictrl)], [ctrl(2,ictrl) ctrl(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
    end
end
