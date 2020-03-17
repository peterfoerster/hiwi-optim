function [] = plot_electrode_boundary_dat (filename, geometry)
   iptc = [2 3 4 5 6 7 8 9 9];
   ibnd = [1 1 1 1 3 3 3 2 3];

   for ii=1:length(iptc)
      bnds = nrbextract(geometry(iptc(ii)).nurbs);
      figure(3);
      hold on;
      view(2);
      nrbkntplot(bnds(ibnd(ii)));
      nrbplot_dat3D_line (bnds(ibnd(ii)), 2^8, ['electrode_boundary_' num2str(iptc(ii)) '_' num2str(ibnd(ii)) '.dat']);
      hold off;
   end
end
