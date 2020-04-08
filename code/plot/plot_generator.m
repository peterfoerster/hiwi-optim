function [] = plot_generator (filename)
   generator = dlmread(filename);
   x = generator(:,1:3);

   hold on;
   scatter(x(1:7,1), x(1:7,2), 'r', 'filled', 'marker', 'o');
   scatter(x(7:end,1), x(7:end,2), 'b', 'marker', 'x');
   hold off;

   xlabel('x');
   ylabel('y');
end
