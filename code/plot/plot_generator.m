function [] = plot_generator (filename)
   generator = dlmread(filename);
   x = generator(:,1:3);

   write_dat1D([filename '_probe.dat'], x(1:7,1)*1e3, x(1:7,2)*1e3);
   write_dat1D([filename '_gen.dat'], x(7:end,1)*1e3, x(7:end,2)*1e3);

   % hold on;
   % scatter(x(1:7,1)*1e3, x(1:7,2)*1e3, 'r', 'filled', 'marker', 'o');
   % scatter(x(7:end,1)*1e3, x(7:end,2)*1e3, 'b', 'marker', 'x');
   % hold off;
   % xlabel('x/mm');
   % ylabel('y/mm');

   % dt_max = max(generator(:,7)) - min(generator(:,7));
   % fprintf('\n bunch length %d ps \n', dt_max*1e3);
   % dt_avg = sort(generator(:,7));
   % dt_avg = mean(diff(dt_avg));
   % fprintf('\n average distance %d ps \n', dt_avg*1e3);

   dt = 2e-3;
   t  = -15e-3:dt:15e-3;
   I  = zeros(length(t),1);
   for it=1:length(t)
      ix    = t(it)-dt < generator(:,7) & generator(:,7) < t(it)+dt;
      I(it) = sum(ix);
   end
   % plot(t*1e3,I);
   % xlabel('t/ps');
   % ylabel('N_{part}');

   write_dat1D([filename '_tmp.dat'], t*1e3, I);
end
