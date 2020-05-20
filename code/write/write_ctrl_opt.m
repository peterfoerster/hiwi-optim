function [] = write_ctrl_opt (geometry)
   nsub  = 8;
   % electrode
   iptcs = [10 14 15 16 17 18 19];
   ibnds = [ 3  3  1  1  1  4  4];

   % anode ring
   % iptcs = [2 3 4 7 8 9 10 13 12];
   % ibnds = [2 2 2 4 4 4  4  1  1];

   for ii=1:length(iptcs)
      hold on;
      bnds = nrbextract(geometry(iptcs(ii)).nurbs);
      % nrbctrlplot_dat(bnds(ibnds(ii)), nsub, ['nurbs_' num2str(iptcs(ii)) '_' num2str(ibnds(ii))]);
      nrbctrlplot(bnds(ibnds(ii)));
      hold off;
   end
end
