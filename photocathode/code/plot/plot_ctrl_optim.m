function [] = plot_ctrl_optim (geometry)
   iptcs = [15 16 17 18 19 20 21];
   ibnds = [ 3  3  3  3  3  2  2];

   for ii=1:length(iptcs)
      hold on;
      bnds = nrbextract(geometry(iptcs(ii)).nurbs);
      nrbctrlplot(bnds(ibnds(ii)));
      hold off;
   end
end
