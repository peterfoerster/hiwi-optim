function [ptcs] = create_ptcs_increase (ptcs, iptcs, ibnds)
   for ii=1:length(iptcs)
      bnds            = nrbextract(ptcs(iptcs(ii)));
      bnds(ibnds(ii)) = nrbdegelev(bnds(ibnds(ii)), 1);
      ptcs(iptcs(ii)) = nrbcoons(bnds(3), bnds(4), bnds(1), bnds(2));
   end
end
