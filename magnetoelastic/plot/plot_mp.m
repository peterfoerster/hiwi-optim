function [] = plot_mp (filename)
   [geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([filename '.txt']);

   for iptc=1:length(geometry)
      hold on;
      nrbkntplot(geometry(iptc).nurbs);
      hold off;
   end
   view(2);
end
