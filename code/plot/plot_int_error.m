function [] = plot_int_error (H_it, err_linf)
   figure(3);
   hold on;
   plot(2.^H_it, err_linf(:,1,1), 2.^H_it, err_linf(:,2,1));
   xlabel('H/ns');
   ylabel('||\Delta x_{rms}||_\infty');
   hold off;

   figure(4);
   hold on;
   plot(2.^H_it, err_linf(:,1,2), 2.^H_it, err_linf(:,2,2));
   xlabel('H/ns');
   ylabel('||\Delta \epsilon||_\infty');
   hold off;
end
