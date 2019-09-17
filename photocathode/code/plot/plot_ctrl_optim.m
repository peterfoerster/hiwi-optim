function [] = plot_ctrl_optim (ptcs)
   iptcs = [6 7 8 9 12 13];
   ibnds = [3 3 3 3  2  2];

   for ii=1:length(iptcs)
      hold on;
      bnds = nrbextract(ptcs(iptcs(ii)));
      nrbctrlplot(bnds(ibnds(ii)));
      hold off;
   end
end
