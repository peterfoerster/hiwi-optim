function [nrb_optim, knts] = create_nrb_optim (ptcs, order)
   bnds    = nrbextract(ptcs(15));
   crv(15) = bnds(3);
   bnds    = nrbextract(ptcs(16));
   crv(16) = nrbdegelev(bnds(3), 1);
   bnds    = nrbextract(ptcs(17));
   crv(17) = nrbdegelev(bnds(3), 1);
   bnds    = nrbextract(ptcs(18));
   crv(18) = nrbdegelev(bnds(3), 1);
   bnds    = nrbextract(ptcs(19));
   crv(19) = bnds(3);
   bnds    = nrbextract(ptcs(20));
   crv(20) = bnds(2);
   bnds    = nrbextract(ptcs(21));
   crv(21) = bnds(2);

   % glue nurbs
   ctrl = [crv(21).coefs(:,1:2) crv(20).coefs(:,2) crv(19).coefs(:,2) crv(18).coefs(:,2) crv(17).coefs(:,2) crv(16).coefs(:,2) crv(15).coefs(:,2:3)];
   knts = [zeros(1,3) 2/9 3/9 5/9 6/9 7/9 8/9 ones(1,3)];
   nrb_optim = nrbmak(ctrl, knts);

   % determine correct knts
   for ii=1:512
      pt(21) = nrbinverse_mod(nrb_optim, nrbeval(crv(21),1));
      pt(20) = nrbinverse_mod(nrb_optim, nrbeval(crv(20),1));
      pt(19) = nrbinverse_mod(nrb_optim, nrbeval(crv(19),1));
      pt(18) = nrbinverse_mod(nrb_optim, nrbeval(crv(18),1));
      pt(17) = nrbinverse_mod(nrb_optim, nrbeval(crv(17),1));
      pt(16) = nrbinverse_mod(nrb_optim, nrbeval(crv(16),1));
      knts_new = [zeros(1,3) pt(21) pt(20) pt(19) pt(18) pt(17) pt(16) ones(1,3)];
      err      = (knts(4:end-3)-knts_new(4:end-3))./knts_new(4:end-3);
      if (err < 1e-3)
         % fprintf('\nconverged in %d iterations\n', ii);
         break;
      end
      nrb_optim = nrbmak(ctrl, knts_new);
      knts      = knts_new;
   end

   % elevate degree
   if (order > 3)
      nrb_optim = nrbdegelev(nrb_optim, order-3);
   end
end
