function [nrb_optim, knts] = create_nrb_optim (ptcs, order)
   bnds    = nrbextract(ptcs(5));
   crv(5)  = bnds(1);
   bnds    = nrbextract(ptcs(6));
   crv(6)  = bnds(3);
   bnds    = nrbextract(ptcs(7));
   crv(7)  = nrbdegelev(bnds(3), 1);
   bnds    = nrbextract(ptcs(8));
   crv(8)  = nrbdegelev(bnds(3), 1);
   bnds    = nrbextract(ptcs(9));
   crv(9)  = nrbdegelev(bnds(3), 1);
   bnds    = nrbextract(ptcs(10));
   crv(10) = bnds(2);
   bnds    = nrbextract(ptcs(11));
   crv(11) = bnds(2);

   % glue nurbs
   ctrl = [crv(11).coefs(:,1:2) crv(10).coefs(:,2) crv(9).coefs(:,2) crv(8).coefs(:,2) crv(7).coefs(:,2) crv(6).coefs(:,2) crv(5).coefs(:,2) crv(5).coefs(:,1)];
   knts = [zeros(1,3) 2/9 3/9 5/9 6/9 7/9 8/9 ones(1,3)];
   nrb_optim = nrbmak(ctrl, knts);

   % determine correct knts
   for ii=1:512
      pt(11) = nrbinverse_mod(nrb_optim, nrbeval(crv(11),1));
      pt(10) = nrbinverse_mod(nrb_optim, nrbeval(crv(10),1));
      pt(9) = nrbinverse_mod(nrb_optim, nrbeval(crv(9),1));
      pt(8) = nrbinverse_mod(nrb_optim, nrbeval(crv(8),1));
      pt(7) = nrbinverse_mod(nrb_optim, nrbeval(crv(7),1));
      pt(6) = nrbinverse_mod(nrb_optim, nrbeval(crv(6),1));
      knts_new = [zeros(1,3) pt(11) pt(10) pt(9) pt(8) pt(7) pt(6) ones(1,3)];
      err      = (knts(4:end-3)-knts_new(4:end-3))./knts_new(4:end-3);
      if (err < 1e-4)
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
