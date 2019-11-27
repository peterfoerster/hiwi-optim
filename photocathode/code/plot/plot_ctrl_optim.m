function [geometry] = plot_ctrl_optim (filename)
   [geometry] = mp_geo_load ([filename '.txt']);

   iptcs = [5 6 7 8 9];
   ibnds = [1 3 3 3 2];

   for ii=1:length(iptcs)
      hold on;
      bnds = nrbextract(geometry(iptcs(ii)).nurbs);
      nrbctrlplot(bnds(ibnds(ii)));
      hold off;
   end
end
