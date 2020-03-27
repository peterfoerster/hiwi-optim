function [] = plot_generator (filename, geometry, z_min)
   generator = dlmread(filename);
   x = generator(:,1:3);

   cathode = geometry(6).nurbs;
   pnt     = [0 0 0];
   ext     = [1 0 0];
   cathode = nrbrevolve(cathode, pnt, ext, 2*pi);
   cathode = nrbextract(cathode);

   hold on;
   nrbkntplot(cathode(5));
   scatter3(x(1:7,3)+z_min, x(1:7,2), x(1:7,1), 'r', 'filled', 'marker', 'o');
   scatter3(x(7:end,3)+z_min, x(7:end,2), -x(7:end,1), 'b', 'marker', 'x');
   hold off;

   xlabel('z');
   ylabel('y');
   zlabel('x');
   view(3);
end
