function [nrb_opt, knts, ptcs_vac, ptcs_el, nrb_orig] = create_nrb_opt_electrode (order)
    electrode       = create_electrode_v6();
    anode_ring      = create_anodering_v6();
    inner_insulator = create_innerinsulator_v6();
    outer_insulator = create_outerinsulator_v6();
    vacuumchamber   = create_vacuumchamber_v6 (electrode, anode_ring, inner_insulator, outer_insulator);
    domain_vac      = discretize_vacuumchamber_v6 (electrode, anode_ring, inner_insulator, outer_insulator, vacuumchamber);
    domain_el       = discretize_electrode_v6 (electrode);
    [ptcs_vac, ptcs_el] = create_ptcs_v6 (electrode, anode_ring, inner_insulator, outer_insulator, ...
                                          vacuumchamber, domain_vac, domain_el);

    bnds    = nrbextract(ptcs_vac(10));
    crv(10) = bnds(3);
    bnds    = nrbextract(ptcs_vac(14));
    crv(14) = bnds(3);
    bnds    = nrbextract(ptcs_vac(15));
    crv(15) = bnds(1);
    bnds    = nrbextract(ptcs_vac(16));
    crv(16) = bnds(1);
    bnds    = nrbextract(ptcs_vac(17));
    crv(17) = bnds(4);
    bnds    = nrbextract(ptcs_vac(18));
    crv(18) = bnds(4);

    % glue nurbs
    if (order == 3)
        ctrl = [crv(18).coefs(:,1:2) crv(17).coefs(:,2) crv(16).coefs(:,2) crv(15).coefs(:,2) ...
                flip(crv(14).coefs(:,2), 2) flip(crv(10).coefs(:,1:2), 2)];
        pt(18) = 0.093;
        pt(17) = 0.186;
        pt(16) = 0.680;
        pt(15) = 0.777;
        pt(14) = 0.874;
        knts = [zeros(1,order) pt(18) pt(17) pt(16) pt(15) pt(14) ones(1,order)];
        nrb_opt = nrbmak(ctrl, knts);
    elseif (order == 4)
        crv(16) = nrbdegelev(crv(16), 1);
        ctrl = [crv(18).coefs(:,1:2) crv(17).coefs(:,2) crv(16).coefs(:,2:3) crv(15).coefs(:,2) ...
                flip(crv(14).coefs(:,2), 2) flip(crv(10).coefs(:,1:2), 2)];
        pt(18) = 0.033;
        pt(17) = 0.113;
        pt(16) = 0.872;
        pt(15) = 0.959;
        pt(14) = 0.987;
        knts = [zeros(1,order) pt(18) pt(17) pt(16) pt(15) pt(14) ones(1,order)];
        nrb_opt = nrbmak(ctrl, knts);
    elseif (order == 5)
        crv(16) = nrbdegelev(crv(16), 2);
        ctrl = [crv(18).coefs(:,1:2) crv(17).coefs(:,2) crv(16).coefs(:,2:4) crv(15).coefs(:,2) ...
                flip(crv(14).coefs(:,2), 2) flip(crv(10).coefs(:,1:2), 2)];
        pt(18) = 0.019;
        pt(17) = 0.091;
        pt(16) = 0.904;
        pt(15) = 0.980;
        pt(14) = 0.995;
        knts = [zeros(1,order) pt(18) pt(17) pt(16) pt(15) pt(14) ones(1,order)];
        nrb_opt = nrbmak(ctrl, knts);
    elseif (order >= 8)
        % B-spline
        ctrl = [crv(18).coefs(:,1:2)./crv(18).coefs(4,1:2) crv(17).coefs(:,2)./crv(17).coefs(4,2) ...
                crv(16).coefs(:,2)./crv(16).coefs(4,2) crv(15).coefs(:,2)./crv(15).coefs(4,2) ...
                flip(crv(14).coefs(:,2)./crv(14).coefs(4,2), 2) flip(crv(10).coefs(:,1:2)./crv(10).coefs(4,1:2), 2)];
        knts = [zeros(1,8) ones(1,8)];
        nrb_opt = nrbmak(ctrl, knts);

        if (nargout == 5)
            % glue crv
            nrb_orig = nrbglue(crv(18), crv(17));
            nrb_orig = nrbglue(nrb_orig, crv(16));
            nrb_orig = nrbglue(nrb_orig, crv(15));
            nrb_orig = nrbglue(nrb_orig, crv(14));
            nrb_orig = nrbglue(nrb_orig, crv(10));
            nrb_orig.knots = nrb_orig.knots/6;
        end
    else
        error('create_nrb_opt_electrode: order = %i not implemented', order);
    end
end

% only needed once for precomputation:
% approximate knot vector via fixed point iteration
% for ii=1:2^8
%     pt(18) = nrbinverse_mod(nrb_opt, nrbeval(crv(18), 1));
%     pt(17) = nrbinverse_mod(nrb_opt, nrbeval(crv(17), 1));
%     pt(16) = nrbinverse_mod(nrb_opt, nrbeval(crv(16), 1));
%     pt(15) = nrbinverse_mod(nrb_opt, nrbeval(crv(15), 1));
%     pt(14) = nrbinverse_mod(nrb_opt, nrbeval(crv(14), 0));
%
%     knts_new = [zeros(1,order) pt(18) pt(17) pt(16) pt(15) pt(14) ones(1,order)];
%     err = (knts(order+1:end-order)-knts_new(order+1:end-order))./knts_new(order+1:end-order);
%     if (abs(err) < 1e-10)
%        fprintf('%e', abs(err));
%        fprintf('\ncreate_nrb_opt_electrode: converged in %i iterations\n', ii);
%        break;
%     end
%     nrb_opt = nrbmak(ctrl, knts_new);
%     knts    = knts_new;
% end
