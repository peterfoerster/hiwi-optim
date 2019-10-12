function [ptcs] = create_ptcs_optim (ptcs, x, order, crv)
   bnds     = nrbextract(ptcs(11));
   bnds(4)  = nrbline(nrbeval(bnds(1), 1), nrbeval(crv(11), 1));
   ptcs(11) = nrbcoons(bnds(3), bnds(4), bnds(1), crv(11));
   % elevate degree of neighbouring patches
   bnds     = nrbextract(ptcs(13));
   ptcs(13) = nrbcoons(bnds(3), bnds(4), bnds(1), nrbdegelev(bnds(2), order-3));

   bnds     = nrbextract(ptcs(10));
   bnds(3)  = nrbline(nrbeval(bnds(1), 0), nrbeval(crv(10), 0));
   bnds(4)  = nrbline(nrbeval(bnds(1), 1), nrbeval(crv(10), 1));
   ptcs(10) = nrbcoons(bnds(3), bnds(4), bnds(1), crv(10));
   % elevate degree of neighbouring patches
   bnds     = nrbextract(ptcs(12));
   ptcs(12) = nrbcoons(bnds(3), bnds(4), bnds(1), nrbdegelev(bnds(2), order-3));

   bnds     = nrbextract(ptcs(9));
   bnds(1)  = nrbline(nrbeval(crv(9), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(9), 1), nrbeval(bnds(4), 1));
   ptcs(9) = nrbcoons(crv(9), bnds(4), bnds(1), bnds(2));

   bnds     = nrbextract(ptcs(8));
   bnds(1)  = nrbline(nrbeval(crv(8), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(8), 1), nrbeval(bnds(4), 1));
   ptcs(8) = nrbcoons(crv(8), bnds(4), bnds(1), bnds(2));

   bnds     = nrbextract(ptcs(7));
   bnds(1)  = nrbline(nrbeval(crv(7), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(7), 1), nrbeval(bnds(4), 1));
   ptcs(7) = nrbcoons(crv(7), bnds(4), bnds(1), bnds(2));

   bnds     = nrbextract(ptcs(6));
   bnds(1)  = nrbline(nrbeval(crv(6), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(6), 1), nrbeval(bnds(4), 1));
   ptcs(6) = nrbcoons(crv(6), bnds(4), bnds(1), bnds(2));

   bnds    = nrbextract(ptcs(5));
   crv(5)  = nrbreverse(crv(5));
   bnds(3) = nrbline(nrbeval(crv(5), 0), nrbeval(bnds(2), 0));
   bnds(4) = nrbline(nrbeval(crv(5), 1), nrbeval(bnds(2), 1));
   ptcs(5) = nrbcoons(bnds(3), bnds(4), crv(5), bnds(2));
end
