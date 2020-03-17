function [] = plot_electrode_dat (filename, geometry)
   iptc = [1 2 3 4 5 6 7 8 9 9 12 14 22 23 24 25 25 25];
   ibnd = [3 3 3 3 3 5 5 5 4 5  4  6  6  4  4  3  4  6];

   for ii=1:length(iptc)
      nurbs = geometry(iptc(ii)).nurbs;
      pnt   = [0 0 0];
      ext   = [1 0 0];
      nurbs = nrbrevolve(nurbs, pnt, ext, 2*pi);
      nurbs = nrbextract(nurbs);
      hold on;
      figure(1);
      nrbkntplot(nurbs(ibnd(ii)));
      % nrbplot_dat3D (nurbs(ibnd(ii)), [2^4 2^4], ['electrode_' num2str(iptc(ii)) '_' num2str(ibnd(ii)) '.dat']);
      hold off;

      % hold on;
      % bnds = nrbextract(nurbs(ibnd(ii)));
      % figure(2);
      % nrbkntplot(bnds(4));
      % % nrbplot_dat3D (bnds(4), 2^8, ['boundary_' num2str(iptc(ii)) '_' num2str(ibnd(ii)) '.dat']);
      % hold off;
   end

   % 2d boundary
   % plot_electrode_boundary_dat (filename, geometry);
end
