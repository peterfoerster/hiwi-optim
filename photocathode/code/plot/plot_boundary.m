function [] = plot_boundary (nsub, width, geometry, boundaries)
  for ib=1:length(boundaries)
    switch(ib)
      % electrode
      case{1}
        for ip=1:length(boundaries(ib).patches)
          nrbkntplot_mod(nsub, 'b', width, geometry(boundaries(ib).patches(ip)).boundary(boundaries(ib).faces(ip)).nurbs, 0);
        end
      % vacuumchamber
      case{2}
        for ip=1:length(boundaries(ib).patches)
          nrbkntplot_mod(nsub, 'r', width, geometry(boundaries(ib).patches(ip)).boundary(boundaries(ib).faces(ip)).nurbs, 0);
        end
      % symmetry
      case{3}
        for ip=1:length(boundaries(ib).patches)
          nrbkntplot_mod(nsub, 'k', width, geometry(boundaries(ib).patches(ip)).boundary(boundaries(ib).faces(ip)).nurbs, 0);
        end
    end
  end%for
end
