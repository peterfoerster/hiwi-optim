function [] = plot_bounds (lb, ub, filename, order)
    geometry = mp_geo_load ([filename '.txt']);
    write_ctrl_opt (geometry, order);

    if (order == 3)
        % 19
        bnds = nrbextract(geometry(19).nurbs);
        pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

        ictrl = 2;
        ix    = 1;
        hold on;
        plot([pts4(1,ictrl)+lb(ix) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)+ub(ix)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl)+lb(ix+1) pts4(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 18
        bnds = nrbextract(geometry(18).nurbs);
        pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

        ictrl = 2;
        ioff  = 2;
        ix    = ioff + 1;
        hold on;
        plot([pts4(1,ictrl)+lb(ix) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)+ub(ix)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl)+lb(ix+1) pts4(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 17
        bnds = nrbextract(geometry(17).nurbs);
        pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

        ictrl = 2;
        ioff  = 4;
        ix    = ioff + 1;
        hold on;
        plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 16
        bnds = nrbextract(geometry(16).nurbs);
        pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

        ictrl = 2;
        ioff  = 6;
        ix    = ioff + 1;
        hold on;
        plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 15
        bnds  = nrbextract(geometry(15).nurbs);
        pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

        ictrl = 2;
        ioff  = 8;
        ix    = ioff + 1;
        hold on;
        plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 14
        bnds  = nrbextract(geometry(14).nurbs);
        pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

        ictrl = 2;
        ioff  = 10;
        ix = ioff + 1;
        hold on;
        plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
    elseif (order == 4 || order ==5)
        % 18
        bnds = nrbextract(geometry(18).nurbs);
        pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

        ictrl = 2;
        ix    = 1;
        hold on;
        plot([pts4(1,ictrl)+lb(ix) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)+ub(ix)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl)+lb(ix+1) pts4(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 17
        bnds = nrbextract(geometry(17).nurbs);
        pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

        ictrl = 2;
        ioff  = 2;
        ix    = ioff + 1;
        hold on;
        plot([pts4(1,ictrl)+lb(ix) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)+ub(ix)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl)+lb(ix+1) pts4(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 16
        bnds = nrbextract(geometry(16).nurbs);
        pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

        ioff = 4;
        for ictrl=2:(order-1)
            ix = ioff + 2*ictrl - 3;
            hold on;
            plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
            plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
            plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
            plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
            hold off;
        end

        % 15
        bnds  = nrbextract(geometry(15).nurbs);
        pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

        ictrl = order-1;
        ioff  = 4 + 2*(order-2);
        ix    = ioff + 1;
        hold on;
        plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;

        % 14
        bnds  = nrbextract(geometry(14).nurbs);
        pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

        ictrl = 2;
        ioff  = 6 + 2*(order-2);
        ix = ioff + 1;
        hold on;
        plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
        plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
        hold off;
end
