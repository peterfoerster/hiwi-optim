function [crv] = cut_nrb_opt (nrb_opt, order, knts)
    knts = unique(knts(order+1:end-order));
    for ii=1:(order-1)
        nrb_opt = nrbkntins(nrb_opt, knts);
    end
    knts = [zeros(1,order) ones(1,order)];

    ctrl19  = nrb_opt.coefs(:,1:order);
    crv(19) = nrbmak(ctrl19, knts);

    ctrl18  = nrb_opt.coefs(:,(order+1):(2*order));
    crv(18) = nrbmak(ctrl18, knts);

    if (order == 3)
        ctrl17  = nrb_opt.coefs(:,(2*order+1):(3*order));
        crv(17) = nrbmak(ctrl17, knts);

        ctrl16  = nrb_opt.coefs(:,(3*order+1):(4*order));
        crv(16) = nrbmak(ctrl16, knts);
        ioff = 4;
    elseif (order == 4 || order == 5)
        ctrl16  = nrb_opt.coefs(:,(2*order+1):(3*order));
        crv(16) = nrbmak(ctrl16, knts);
        ioff = 3;
    end

    ctrl15  = nrb_opt.coefs(:,(ioff*order+1):((ioff+1)*order));
    crv(15) = nrbmak(ctrl15, knts);
    ioff += 1;

    ctrl14  = nrb_opt.coefs(:,(ioff*order+1):((ioff+1)*order));
    crv(14) = nrbmak(ctrl14, knts);
    ioff += 1;

    ctrl10  = nrb_opt.coefs(:,(ioff*order+1):((ioff+1)*order));
    crv(10) = nrbmak(ctrl10, knts);
end
