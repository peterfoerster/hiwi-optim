function [nrb_opt, knts] = create_nrb_opt_anodering (ptcs, order)
   bnds    = nrbextract(ptcs(2));
   crv(2)  = bnds(2);
   bnds    = nrbextract(ptcs(3));
   crv(3)  = bnds(2);
   bnds    = nrbextract(ptcs(4));
   crv(4)  = bnds(2);
   bnds    = nrbextract(ptcs(7));
   crv(7)  = bnds(4);
   bnds    = nrbextract(ptcs(8));
   crv(8)  = bnds(4);
   bnds    = nrbextract(ptcs(9));
   crv(9)  = bnds(4);
   bnds    = nrbextract(ptcs(10));
   crv(10) = bnds(4);
   bnds    = nrbextract(ptcs(13));
   crv(13) = bnds(1);
   bnds    = nrbextract(ptcs(12));
   crv(12) = bnds(1);

   % elevate degree
   if (order > 3)
      for icrv=2:4
         crv(icrv) = nrbdegelev(crv(icrv), order-3);
      end
      for icrv=7:10
         crv(icrv) = nrbdegelev(crv(icrv), order-3);
      end
      for icrv=12:13
         crv(icrv) = nrbdegelev(crv(icrv), order-3);
      end
   end

   % glue nurbs (iterated knot vector)
   ctrl = [flip(crv(2).coefs(:,2:order), 2) flip(crv(3).coefs(:,2:order-1), 2) flip(crv(4).coefs(:,2:order-1), 2) ...
           crv(7).coefs(:,2:order-1) crv(8).coefs(:,2:order-1) crv(9).coefs(:,2:order-1) ...
           crv(10).coefs(:,2:order-1) crv(13).coefs(:,2:order-1) crv(12).coefs(:,2:order)];
   pt(2)  = 1.6/9;
   pt(3)  = 3.2/9;
   pt(4)  = 3.9/9;
   pt(7)  = 4.5/9;
   pt(8)  = 5.9/9;
   pt(9)  = 6.4/9;
   pt(10) = 7.2/9;
   pt(13) = 8/9;
   knts = [zeros(1,order) repmat(pt(2), 1, order-2) repmat(pt(3), 1, order-2) repmat(pt(4), 1, order-2) ...
           repmat(pt(7), 1, order-2) repmat(pt(8), 1, order-2) repmat(pt(9), 1, order-2) ...
           repmat(pt(10), 1, order-2) repmat(pt(13), 1, order-2) ones(1,order)];
   nrb_opt = nrbmak(ctrl, knts);

   % hold on;
   % nrbctrlplot(nrb_opt);
   % nrbkntplot(nrb_opt);
   % hold off;
end
