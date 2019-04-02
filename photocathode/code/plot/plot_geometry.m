function [] = plot_geometry (geometry, nsub, width, options, boundaries)
  for iptc=1:length(geometry)
    % color option is obsolete for surface plot
    nrbkntplot_mod(nsub, 'b', width, geometry(iptc).nurbs);
    hold on;
    if (options.numbers)
      x = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {0.5,0.5}, 0, geometry(iptc).rdim);
      text(x(1), x(2), num2str(iptc));
    end
  end

  if (options.boundary)
    plot_boundary (nsub, width, geometry, boundaries);
  end

  view(2);
  shading interp;
  grid off;
  hold off;
end
