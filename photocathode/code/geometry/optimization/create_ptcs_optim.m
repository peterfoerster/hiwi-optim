function [ptcs] = create_ptcs_optim (ptcs, x, order, crv)
   bnds     = nrbextract(ptcs(21));
   bnds(4)  = nrbline(nrbeval(bnds(1), 1), nrbeval(crv(21), 1));
   ptcs(21) = nrbcoons(bnds(3), bnds(4), bnds(1), crv(21));
   % elevate degree of neighbouring patches
   bnds     = nrbextract(ptcs(27));
   ptcs(27) = nrbcoons(bnds(3), bnds(4), bnds(1), nrbdegelev(bnds(2), order-3));
   bnds     = nrbextract(ptcs(26));
   ptcs(26) = nrbcoons(bnds(3), bnds(4), bnds(1), nrbdegelev(bnds(2), order-3));

   bnds     = nrbextract(ptcs(20));
   bnds(3)  = nrbline(nrbeval(bnds(1), 0), nrbeval(crv(20), 0));
   bnds(4)  = nrbline(nrbeval(bnds(1), 1), nrbeval(crv(20), 1));
   ptcs(20) = nrbcoons(bnds(3), bnds(4), bnds(1), crv(20));
   % elevate degree of neighbouring patches
   bnds     = nrbextract(ptcs(25));
   ptcs(25) = nrbcoons(bnds(3), bnds(4), bnds(1), nrbdegelev(bnds(2), order-3));
   bnds     = nrbextract(ptcs(24));
   ptcs(24) = nrbcoons(bnds(3), bnds(4), bnds(1), nrbdegelev(bnds(2), order-3));

   bnds     = nrbextract(ptcs(19));
   bnds(1)  = nrbline(nrbeval(crv(19), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(19), 1), nrbeval(bnds(4), 1));
   ptcs(19) = nrbcoons(crv(19), bnds(4), bnds(1), bnds(2));
   % elevate degree of neighbouring patches
   bnds     = nrbextract(ptcs(23));
   ptcs(23) = nrbcoons(bnds(3), bnds(4), bnds(1), nrbdegelev(bnds(2), order-3));
   bnds     = nrbextract(ptcs(22));
   ptcs(22) = nrbcoons(bnds(3), bnds(4), bnds(1), nrbdegelev(bnds(2), order-3));

   bnds     = nrbextract(ptcs(18));
   bnds(1)  = nrbline(nrbeval(crv(18), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(18), 1), nrbeval(bnds(4), 1));
   ptcs(18) = nrbcoons(crv(18), bnds(4), bnds(1), bnds(2));

   bnds     = nrbextract(ptcs(17));
   bnds(1)  = nrbline(nrbeval(crv(17), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(17), 1), nrbeval(bnds(4), 1));
   ptcs(17) = nrbcoons(crv(17), bnds(4), bnds(1), bnds(2));

   bnds     = nrbextract(ptcs(16));
   bnds(1)  = nrbline(nrbeval(crv(16), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(16), 1), nrbeval(bnds(4), 1));
   ptcs(16) = nrbcoons(crv(16), bnds(4), bnds(1), bnds(2));

   bnds     = nrbextract(ptcs(15));
   bnds(1)  = nrbline(nrbeval(crv(15), 0), nrbeval(bnds(4), 0));
   bnds(2)  = nrbline(nrbeval(crv(15), 1), nrbeval(bnds(4), 1));
   ptcs(15) = nrbcoons(crv(15), bnds(4), bnds(1), bnds(2));
end
