function [] = plot_geometry (geometry, boundaries, nsub, width, options)
  for iptc=1:length(geometry)
    % color and width obsolete for surfaces
    nrbkntplot_mod(nsub, 'k', width, geometry(iptc).nurbs);
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
