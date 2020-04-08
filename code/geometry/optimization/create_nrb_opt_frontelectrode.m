function [nrb_opt, knts] = create_nrb_opt_frontelectrode (ptcs, order)
   bnds    = nrbextract(ptcs(8));
   crv(8)  = bnds(3);
   bnds    = nrbextract(ptcs(9));
   crv(9)  = bnds(3);
   bnds    = nrbextract(ptcs(10));
   crv(10) = bnds(3);
   bnds    = nrbextract(ptcs(14));
   crv(14) = bnds(3);
   bnds    = nrbextract(ptcs(15));
   crv(15) = bnds(1);

   % elevate degree
   if (order > 3)
      for icrv=8:10
         crv(icrv) = nrbdegelev(crv(icrv), order-3);
      end
      for icrv=14:15
         crv(icrv) = nrbdegelev(crv(icrv), order-3);
      end
   end

   % glue nurbs
   ctrl = [crv(8).coefs(:,1:order-1) crv(9).coefs(:,2:order-1) ...
           crv(10).coefs(:,2:order-1) crv(14).coefs(:,2:order-1) flip(crv(15).coefs(:,1:order-1), 2)];
   pt(8)  = 0.137;
   pt(9)  = 0.182;
   pt(10) = 0.506;
   pt(14) = 0.753;
   knts = [zeros(1,order) repmat(pt(8), 1, order-2) ...
           repmat(pt(9), 1, order-2) repmat(pt(10), 1, order-2) repmat(pt(14), 1, order-2) ones(1,order)];
   nrb_opt = nrbmak(ctrl, knts);
end

% only needed for precomputation once
% determine correct knts
% for ii=1:2^8
%    pt(8)  = nrbinverse(nrb_opt, nrbeval(crv(8), 1), 'Display', 'false');
%    pt(9)  = nrbinverse(nrb_opt, nrbeval(crv(9), 1), 'Display', 'false');
%    pt(10) = nrbinverse(nrb_opt, nrbeval(crv(10), 1), 'Display', 'false');
%    pt(14) = nrbinverse(nrb_opt, nrbeval(crv(14), 1), 'Display', 'false');
%    knts_new = [zeros(1,order) repmat(pt(8), 1, order-2) ...
%                repmat(pt(9), 1, order-2) repmat(pt(10), 1, order-2) repmat(pt(14), 1, order-2) ones(1,order)];
%    err      = (knts(order+1:end-order)-knts_new(order+1:end-order))./knts_new(order+1:end-order);
%    if (abs(err) < 1e-10)
%       fprintf('%e', abs(err));
%       fprintf('\nconverged in %d iterations\n', ii);
%       break;
%    end
%    nrb_opt = nrbmak(ctrl, knts_new);
%    knts    = knts_new;
% end
