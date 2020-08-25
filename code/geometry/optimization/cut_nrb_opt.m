% INPUT:
%       - nrb_opt:
%       - order:
%       - knts:
%       - ptcs_vac:
%       - continuity
% OUTPUT:
%       - crv:

function [crv] = cut_nrb_opt (nrb_opt, order, knts, ptcs_vac, continuity)
    if (order >= 8)
        % possibly specify different starting intervals
        bnds    = nrbextract(ptcs_vac(18));
        crv(18) = bnds(2);
        pt(18)  = compute_intersectionu(nrb_opt, crv(18), [0 0.25]);

        bnds    = nrbextract(ptcs_vac(17));
        crv(17) = bnds(2);
        pt(17)  = compute_intersectionv(nrb_opt, crv(17), [0.1 0.5]);

        bnds    = nrbextract(ptcs_vac(16));
        crv(16) = bnds(4);
        pt(16)  = compute_intersectionv(nrb_opt, crv(16), [0.5 0.75]);

        bnds    = nrbextract(ptcs_vac(15));
        crv(15) = bnds(4);
        pt(15)  = compute_intersectionv(nrb_opt, crv(15), [0.5 0.85]);

        bnds    = nrbextract(ptcs_vac(14));
        crv(14) = bnds(1);
        % orientation of curve is reversed
        pt(14)  = compute_intersectionu(nrb_opt, crv(14), [1 0.65]);

        knts = [pt(18) pt(17) pt(16) pt(15) pt(14)];
        for ii=1:order
            nrb_opt = nrbkntins(nrb_opt, knts);
        end
    end

    % cut the individual NURBS
    if (continuity == order-1)
        il = max(find(knts < 1/2));
        ih = min(find(knts > 1/2));
        knot = (1/2 - knts(il)) / (knts(ih) - knts(il));

        knts = [zeros(1,order) ones(1,order)];
        ctrl18  = nrb_opt.coefs(:,1:order);
        crv(18) = nrbmak(ctrl18, knts);

        ctrl17  = nrb_opt.coefs(:,order+1:2*order);
        crv(17) = nrbmak(ctrl17, knts);

        ctrl16  = nrb_opt.coefs(:,2*order+1:3*order+1);
        crv(16) = nrbmak(ctrl16, [zeros(1,order) knot ones(1,order)]);

        ctrl15  = nrb_opt.coefs(:,3*order+2:4*order+1);
        crv(15) = nrbmak(ctrl15, knts);

        ctrl14  = nrb_opt.coefs(:,4*order+2:5*order+1);
        crv(14) = nrbmak(ctrl14, knts);

        ctrl10  = nrb_opt.coefs(:,5*order+2:6*order+1);
        crv(10) = nrbmak(ctrl10, knts);
    else
        knts = [zeros(1,order) ones(1,order)];
        ctrl18  = nrb_opt.coefs(:,1:order);
        crv(18) = nrbmak(ctrl18, knts);

        ctrl17  = nrb_opt.coefs(:,order+1:2*order);
        crv(17) = nrbmak(ctrl17, knts);

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
