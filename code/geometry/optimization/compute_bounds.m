% INPUT:
%       - x:
%       - order:
%       - N_ctrl
%       - continuity
% OUTPUT:
%       - lb:
%       - ub:

function [lb, ub] = compute_bounds (x, order, N_ctrl, continuity)
    geometry_file = 'geometry_v6_orig';
    [geometry] = mp_geo_load ([geometry_file '.txt']);

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
    ctrl    = nrb_opt.coefs ./ nrb_opt.coefs(4,:);

    tol = 1e-4;
    lb = ub = NaN(N_ctrl,1);

    % minimum y-value
    bnds  = nrbextract(geometry(14).nurbs);
    y_min = nrbeval(bnds(3), 1);
    y_min = y_min(2);

    % maximum y-value
    bnds  = nrbextract(geometry(15).nurbs);
    y_max = nrbeval(bnds(3), 0.5);
    y_max = y_max(2);

    % minimum x-value (patch 14)
    bnds  = nrbextract(geometry(15).nurbs);
    x_min = nrbeval(bnds(3), 0);
    x_min = x_min(1);

    % 18
    bnds = nrbextract(geometry(18).nurbs);
    pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
    pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

    ictrl = 2;
    ix    = 1;
    lb(ix) = (pts3(1,end) - tol) - ctrl(1,ictrl);
    ub(ix) = (pts4(1,1) - tol) - ctrl(1,ictrl);
    lb(ix+1) = 0;
    ub(ix+1) = (pts3(2,end) - tol) - ctrl(2,ictrl);

    % 17
    bnds = nrbextract(geometry(17).nurbs);
    pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
    pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

    ictrl += 1;
    ioff  = 2;
    ix    = ioff + 1;

    lb(ix)   = (pts3(1,1) + tol) - ctrl(1,ictrl);
    ub(ix)   = (pts4(1,end) - tol) - ctrl(1,ictrl);
    if (continuity == order-1)
        bnds18 = nrbextract(geometry(18).nurbs);
        pts18  = bnds18(4).coefs(1:2,:) ./ bnds18(4).coefs(4,:);
        lb(ix+1) = (pts18(2,1) + tol) - ctrl(2,ictrl);
    else
        lb(ix+1) = (pts4(2,1) + tol) - ctrl(2,ictrl);
    end
    ub(ix+1) = (y_max - tol) - ctrl(2,ictrl);

    if (order >= 10)
        ictrl += 1;
        ioff  += 2;
        ix    = ioff + 1;
        lb(ix) = (pts3(1,1) + tol) - ctrl(1,ictrl);

        % 16
        bnds = nrbextract(geometry(16).nurbs);
        pts2 = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);

        ub(ix)   = (pts2(1,end) - tol) - ctrl(1,ictrl);
        lb(ix+1) = (y_min + tol) - ctrl(2,ictrl);
        ub(ix+1) = (y_max - tol) - ctrl(2,ictrl);
    end

    % 16
    bnds = nrbextract(geometry(16).nurbs);
    pts2 = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);

    ictrl += 1;
    ioff  += 2;
    ix    = ioff + 1;
    lb(ix)   = (pts2(1,1) + tol) - ctrl(1,ictrl);
    ub(ix)   = (pts2(1,end) - tol) - ctrl(1,ictrl);
    lb(ix+1) = (y_min + tol) - ctrl(2,ictrl);
    ub(ix+1) = (y_max - tol) - ctrl(2,ictrl);

    if (order == 9 || order == 11 || continuity == order-1)
        ictrl += 1;
        ioff  += 2;
        ix    = ioff + 1;
        lb(ix)   = (pts2(1,1) + tol) - ctrl(1,ictrl);
        ub(ix)   = (pts2(1,end) - tol) - ctrl(1,ictrl);
        lb(ix+1) = (y_min + tol) - ctrl(2,ictrl);
        ub(ix+1) = (y_max - tol) - ctrl(2,ictrl);
    end

    if (order >= 10)
        ictrl += 1;
        ioff  += 2;
        ix    = ioff + 1;
        lb(ix) = (pts2(1,1) + tol) - ctrl(1,ictrl);

        % 15
        bnds = nrbextract(geometry(15).nurbs);
        pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

        ub(ix)   = (pts4(1,end) - tol) - ctrl(1,ictrl);
        lb(ix+1) = (y_min + tol) - ctrl(2,ictrl);
        ub(ix+1) = (y_max - tol) - ctrl(2,ictrl);
    end

    % 15
    bnds = nrbextract(geometry(15).nurbs);
    pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
    pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

    ictrl += 1;
    ioff  += 2;
    ix    = ioff + 1;
    lb(ix) = (pts3(1,1) + tol) - ctrl(1,ictrl);
    ub(ix) = (pts4(1,end) - tol) - ctrl(1,ictrl);

    % 14
    bnds = nrbextract(geometry(14).nurbs);
    pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

    lb(ix+1) = (pts3(2,1) + tol) - ctrl(2,ictrl);
    ub(ix+1) = (y_max - tol) - ctrl(2,ictrl);

    % 14
    bnds = nrbextract(geometry(14).nurbs);
    pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
    pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);

    ictrl += 1;
    ioff  += 2;
    ix    = ioff + 1;
    lb(ix) = (x_min + tol) - ctrl(1,ictrl);
    ub(ix) = (pts4(1,1) - tol) - ctrl(1,ictrl);

    % 10
    bnds = nrbextract(geometry(10).nurbs);
    pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);

    lb(ix+1) = (pts3(2,1) + tol) - ctrl(2,ictrl);
    ub(ix+1) = (y_max - tol) - ctrl(2,ictrl);
end
