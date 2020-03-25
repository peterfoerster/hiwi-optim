function [] = plot_ctrl_opt (geometry)
   nsub  = 8;
   iptcs = [5 6 7 8 9];
   ibnds = [1 3 3 3 2];

   for ii=1:length(iptcs)
      hold on;
      bnds = nrbextract(geometry(iptcs(ii)).nurbs);
      nrbctrlplot_dat(bnds(ibnds(ii)), nsub, ['nurbs_' num2str(iptcs(ii)) '_' num2str(ibnds(ii))]);
      hold off;
   end
end
