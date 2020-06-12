function [crv] = cut_nrb_opt (nrb_opt, order, knts)
    knts = unique(knts(order+1:end-order));
    for ii=1:(order-1)
        nrb_opt = nrbkntins(nrb_opt, knts);
    end

%     % insert control points at the patch boundaries
%     pt19 = nrbeval(nrb_opt, knts(1));
%     pt18 = nrbeval(nrb_opt, knts(2));
%     pt16 = nrbeval(nrb_opt, knts(3));
%     pt15 = nrbeval(nrb_opt, knts(4));
%     pt14 = nrbeval(nrb_opt, knts(5));
%
%     ctrl19 = [pt19; 1];
%     ctrl18 = [pt18; 1];
%     ctrl16 = [pt16; 1];
%     ctrl15 = [pt15; 1];
%     ctrl14 = [pt14; 1];
%
%     coefs = nrb_opt.coefs;
%     ctrl  = [coefs(:,1:order-2) repmat(ctrl19,1,order-1) coefs(:,order+2) repmat(ctrl18,1,order-1) ...
%              coefs(:,2*order+2:2*order+3) repmat(ctrl16,1,order-1) coefs(:,3*order+3) repmat(ctrl15,1,order-1) ...
%              coefs(:,4*order+3) repmat(ctrl14,1,order-1) coefs(:,5*order+3:end)];
%     nrb   = nrbmak(ctrl, nrb_opt.knots);
%
%     % remove order-2 knots until order-2 continuous
%     knots = [nrb.knots(1:order) nrb.knots(order+1:order+2) nrb.knots(2*order+1:2*order+2) nrb.knots(3*order+1:3*order+2) ...
%             nrb.knots(4*order+1:4*order+2) nrb.knots(5*order+1:5*order+2) nrb.knots(6*order+1:end)];
%     % remove order-2 control points to attain order curve
%     ctrl  = [coefs(:,1:order-2) repmat(ctrl19,1,order-3) coefs(:,order+2) repmat(ctrl18,1,order-3) ...
%              coefs(:,2*order+2:2*order+3) repmat(ctrl16,1,order-3) coefs(:,3*order+3) repmat(ctrl15,1,order-3) ...
%              coefs(:,4*order+3) repmat(ctrl14,1,order-3) coefs(:,5*order+3:end)];
%
%     nrb_opt = nrbmak(ctrl, knots);
%
% nrbctrlplot(nrb_opt);
%
%     % check if C2 continuous again
%     % [der, der2] = nrbderiv(nrb_opt);
%
%     % perform knot insertion to attain the final NURBS
%     for ii=2:(order-1)
%         nrb_opt = nrbkntins(nrb_opt, knts);
%     end

    % cut the individual NURBS
    knts = [zeros(1,order) ones(1,order)];

    ctrl19  = nrb_opt.coefs(:,1:order);
    % ctrl19(:,end) = ctrl19(:,end) / ctrl19(end,end);
    crv(19) = nrbmak(ctrl19, knts);

    ctrl18  = nrb_opt.coefs(:,order+1:2*order);
    % ctrl18(:,1) = ctrl18(:,1) / ctrl18(end,1);
    crv(18) = nrbmak(ctrl18, knts);

%     [dert, dert2] = nrbderiv(crv(19));
%     [der, der2] = nrbderiv(crv(18));
%     nrbeval(dert, 1)
%     nrbeval(der, 0)
%     nrbeval(dert2, 1)
%     nrbeval(der2, 0)
% keyboard

    ctrl16  = nrb_opt.coefs(:,2*order+1:3*order);
    crv(16) = nrbmak(ctrl16, knts);

    ctrl15  = nrb_opt.coefs(:,3*order+1:4*order);
    % ctrl15(:,end) = ctrl15(:,end) / ctrl15(end,end);
    crv(15) = nrbmak(ctrl15, knts);

    ctrl14  = nrb_opt.coefs(:,4*order+1:5*order);
    % ctrl14(:,1) = ctrl14(:,1) / ctrl14(end,1);
    % ctrl14(:,end) = ctrl14(:,end) / ctrl14(end,end);
    crv(14) = nrbmak(ctrl14, knts);

    ctrl10  = nrb_opt.coefs(:,5*order+1:6*order);
    % ctrl10(:,1) = ctrl10(:,1) / ctrl10(end,1);
    crv(10) = nrbmak(ctrl10, knts);

icrv = [19 18 16 15 14 10];
for ii=icrv
    hold on;
    nrbplot(crv(ii), 100);
    hold off;
end
end
