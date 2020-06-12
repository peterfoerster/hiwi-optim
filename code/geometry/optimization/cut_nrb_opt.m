function [crv] = cut_nrb_opt (nrb_opt, order, knts)
    knts = unique(knts(order+1:end-order));
    for ii=1:(order-1)
        nrb_opt = nrbkntins(nrb_opt, knts);
    end

    % cut the individual NURBS
    knts = [zeros(1,order) ones(1,order)];
    if (order == 3)
        ctrl19  = nrb_opt.coefs(:,1:order);
        crv(19) = nrbmak(ctrl19, knts);

        ctrl18  = nrb_opt.coefs(:,order+1:2*order);
        crv(18) = nrbmak(ctrl18, knts);

        ctrl17  = nrb_opt.coefs(:,2*order+1:3*order);
        crv(17) = nrbmak(ctrl17, knts);

        ctrl16  = nrb_opt.coefs(:,3*order+1:4*order);
        crv(16) = nrbmak(ctrl16, knts);

        ctrl15  = nrb_opt.coefs(:,4*order+1:5*order);
        crv(15) = nrbmak(ctrl15, knts);

        ctrl14  = nrb_opt.coefs(:,5*order+1:6*order);
        crv(14) = nrbmak(ctrl14, knts);

        ctrl10  = nrb_opt.coefs(:,6*order+1:7*order);
        crv(10) = nrbmak(ctrl10, knts);
    elseif (order == 4 || order == 5)
        ctrl19  = nrb_opt.coefs(:,1:order);
        crv(19) = nrbmak(ctrl19, knts);

        ctrl18  = nrb_opt.coefs(:,order+1:2*order);
        crv(18) = nrbmak(ctrl18, knts);

        ctrl16  = nrb_opt.coefs(:,2*order+1:3*order);
        crv(16) = nrbmak(ctrl16, knts);

        ctrl15  = nrb_opt.coefs(:,3*order+1:4*order);
        crv(15) = nrbmak(ctrl15, knts);

        ctrl14  = nrb_opt.coefs(:,4*order+1:5*order);
        crv(14) = nrbmak(ctrl14, knts);

        ctrl10  = nrb_opt.coefs(:,5*order+1:6*order);
        crv(10) = nrbmak(ctrl10, knts);
    end
end
