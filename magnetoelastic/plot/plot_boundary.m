function [] = plot_boundary (geometry, boundaries)
   width = 4;
   nsub  = 8;
   for ib=1:length(boundaries)
      switch(ib)
         % electrode
         case{1}
            for ip=1:length(boundaries(ib).patches)
               nrbplot_color('b', width, geometry(boundaries(ib).patches(ip)).boundary(boundaries(ib).faces(ip)).nurbs, nsub);
            end
         % vacuumchamber
         case{2}
            for ip=1:length(boundaries(ib).patches)
               nrbplot_color('r', width, geometry(boundaries(ib).patches(ip)).boundary(boundaries(ib).faces(ip)).nurbs, nsub);
            end
         % symmetry
         case{3}
            for ip=1:length(boundaries(ib).patches)
               nrbplot_color('k', width, geometry(boundaries(ib).patches(ip)).boundary(boundaries(ib).faces(ip)).nurbs, nsub);
            end
      end
   end%for
end
