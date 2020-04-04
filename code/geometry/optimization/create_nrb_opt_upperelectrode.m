function [nrb_opt, knts] = create_nrb_opt_upperelectrode (ptcs, order)
   bnds    = nrbextract(ptcs(14));
   crv(14) = bnds(3);
   bnds    = nrbextract(ptcs(15));
   crv(15) = bnds(1);
   bnds    = nrbextract(ptcs(16));
   crv(16) = bnds(1);
   bnds    = nrbextract(ptcs(17));
   crv(17) = bnds(1);
   bnds    = nrbextract(ptcs(18));
   crv(18) = bnds(4);
   bnds    = nrbextract(ptcs(19));
   crv(19) = bnds(4);

   % elevate degree
   if (order > 3)
      for icrv=14:19
         crv(icrv) = nrbdegelev(crv(icrv), order-3);
      end
   end

   % glue nurbs
   ctrl = [crv(19).coefs(:,1:order-1) crv(18).coefs(:,2:order-1) crv(17).coefs(:,2:order-1) ...
           crv(16).coefs(:,2:order-1) crv(15).coefs(:,2:order-1) flip(crv(14).coefs(:,1:order-1), 2)];
   pt(19) = 0.112;
   pt(18) = 0.214;
   pt(17) = 0.487;
   pt(16) = 0.733;
   pt(15) = 0.839;
   knts = [zeros(1,order) repmat(pt(19), 1, order-2) repmat(pt(18), 1, order-2) ...
           repmat(pt(17), 1, order-2) repmat(pt(16), 1, order-2) repmat(pt(15), 1, order-2) ones(1,order)];
   nrb_opt = nrbmak(ctrl, knts);
end

% only needed for precomputation once
% determine correct knts
% for ii=1:2^8
%    pt(19) = nrbinverse(nrb_opt, nrbeval(crv(19), 1), 'Display', 'false');
%    pt(18) = nrbinverse(nrb_opt, nrbeval(crv(18), 1), 'Display', 'false');
%    pt(17) = nrbinverse(nrb_opt, nrbeval(crv(17), 1), 'Display', 'false');
%    pt(16) = nrbinverse(nrb_opt, nrbeval(crv(16), 1), 'Display', 'false');
%    pt(15) = nrbinverse(nrb_opt, nrbeval(crv(15), 1), 'Display', 'false');
%    knts_new = [zeros(1,order) repmat(pt(19), 1, order-2) repmat(pt(18), 1, order-2) ...
%                repmat(pt(17), 1, order-2) repmat(pt(16), 1, order-2) repmat(pt(15), 1, order-2) ones(1,order)];
%    err      = (knts(order+1:end-order)-knts_new(order+1:end-order))./knts_new(order+1:end-order);
%    if (abs(err) < 1e-10)
%       fprintf('%e', abs(err));
%       fprintf('\nconverged in %d iterations\n', ii);
%       break;
%    end
%    nrb_opt = nrbmak(ctrl, knts_new);
%    knts    = knts_new;
% end
