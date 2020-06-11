function [crv] = cut_nrb_opt (nrb_opt, order, knts)
    keyboard
    % knts = unique(knts(order+1:end-order));
    % for ii=1:(order-1)
    %     nrb_opt = nrbkntins(nrb_opt, knts);
    % end
    % knts = [zeros(1,order) ones(1,order)];

% skip before here
    nrb = nrb_opt;
    for ii=1:order-1
        nrb = nrbkntins(nrb, nrb_opt.knots(order+1));
    end

    coefs = nrb.coefs
    pt19 = nrbeval(nrb_opt, knts(order+1))
    scatter(pt19(1), pt19(2), 'k', '*');

    ctrl19 = [pt19; 1]
    ctrl = [coefs(:,1:order-1) ctrl19 coefs(:,order+1:end)]

    nrb19 = nrbmak(ctrl, nrb.knots);
    % repeat this procedure for all knots, where the curve needs to be cut!
    % should maintain a order 4 or C^2 continuous curve throughout

    % nrb19 = nrbkntins(nrb19, knts(order+1));
keyboard
    ctrl19  = nrb_opt.coefs(:,4:4+order);
    crv(19) = nrbmak(ctrl19, knts);

    ctrl19(:,4) = ctrl19(:,4) / ctrl19(4,4);
    nrb19 = nrbmak(ctrl19, knts);

    [der19, der219]   = nrbderiv(crv(19));
    [dern19, dern219] = nrbderiv(nrb19);

    nrbplot(crv(19), 100);
    hold on;
    nrbplot(nrb19, 100);

    % 1 is interesting
    nrbeval(der19, 1)
    nrbeval(dern19, 1)

    ctrl18  = nrb_opt.coefs(:,(order+1):(2*order));
    crv(18) = nrbmak(ctrl18, knts);

    ctrl18(:,1) = ctrl18(:,1) / ctrl18(4,1);
    ctrl18(:,4) = ctrl18(:,4) / ctrl18(4,4);
    nrb18 = nrbmak(ctrl18, knts);

    [der18, der218]   = nrbderiv(crv(18));
    [dern18, dern218] = nrbderiv(nrb18);

    nrbplot(crv(18), 100);
    hold on;
    nrbplot(nrb18, 100);

    % 0 is interesting
    nrbeval(der18, 0)
    nrbeval(dern18, 0)

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
