function [geometry] = plot_ctrl_optim (filename)
   [geometry] = mp_geo_load ([filename '.txt']);

   iptcs = [5 6 7 8 9 10 11];
   ibnds = [1 3 3 3 3  2  2];

   for ii=1:length(iptcs)
      hold on;
      bnds = nrbextract(geometry(iptcs(ii)).nurbs);
      nrbctrlplot_dat(bnds(ibnds(ii)), ['nurbs_' num2str(iptcs(ii)) '_' num2str(ibnds(ii))]);
      hold off;
   end
end
