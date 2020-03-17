function [geometry] = plot_ctrl_optim_dat (filename)
   [geometry] = mp_geo_load ([filename '.txt']);

   iptcs = [5 6 7 8 9];
   ibnds = [1 3 3 3 2];

   for ii=1:length(iptcs)
      hold on;
      bnds = nrbextract(geometry(iptcs(ii)).nurbs);
      if (iptcs(ii) == 7)
         bnds(ibnds(ii)) = nrbdegelev(bnds(ibnds(ii)), 1);
      end
      nrbctrlplot_dat(bnds(ibnds(ii)), ['nurbs_' num2str(iptcs(ii)) '_' num2str(ibnds(ii))]);
      hold off;
   end
end
