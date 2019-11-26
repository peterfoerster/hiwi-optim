function [nrb_optim, knts] = create_nrb_optim (ptcs, order)
   bnds    = nrbextract(ptcs(5));
   crv(5)  = bnds(1);
   bnds    = nrbextract(ptcs(6));
   crv(6)  = bnds(3);
   bnds    = nrbextract(ptcs(7));
   crv(7)  = nrbdegelev(bnds(3), 1);
   bnds    = nrbextract(ptcs(8));
   crv(8)  = bnds(3);
   bnds    = nrbextract(ptcs(9));
   crv(9)  = bnds(2);

   % elevate degree
   if (order > 3)
      for icrv=5:9
         crv(icrv) = nrbdegelev(crv(icrv), order-3);
      end
   end

   % glue nurbs
   ctrl = [crv(9).coefs(:,1:order-1) crv(8).coefs(:,2:order-1) crv(7).coefs(:,2:order-1) crv(6).coefs(:,2:order-1) flip(crv(5).coefs(:,1:order-1), 2)];
   pt(9) = 0.106;
   pt(8) = 0.213;
   pt(7) = 0.778;
   pt(6) = 0.889;
   knts = [zeros(1,order) repmat(pt(9), 1, order-2) repmat(pt(8), 1, order-2) repmat(pt(7), 1, order-2) repmat(pt(6), 1, order-2) ones(1,order)];
   nrb_optim = nrbmak(ctrl, knts);
end

% only needed for precomputation once
% determine correct knts
% for ii=1:512
%    pt(9) = nrbinverse_mod(nrb_optim, nrbeval(crv(9),1));
%    pt(8) = nrbinverse_mod(nrb_optim, nrbeval(crv(8),1));
%    pt(7) = nrbinverse_mod(nrb_optim, nrbeval(crv(7),1));
%    pt(6) = nrbinverse_mod(nrb_optim, nrbeval(crv(6),1));
%    knts_new = [zeros(1,order) repmat(pt(9), 1, order-2) repmat(pt(8), 1, order-2) repmat(pt(7), 1, order-2) repmat(pt(6), 1, order-2) ones(1,order)];
%    err      = (knts(order+1:end-order)-knts_new(order+1:end-order))./knts_new(order+1:end-order);
%    if (abs(err) < 1e-10)
%       fprintf('%e', abs(err));
%       fprintf('\nconverged in %d iterations\n', ii);
%       break;
%    end
%    nrb_optim = nrbmak(ctrl, knts_new);
%    knts      = knts_new;
% end
