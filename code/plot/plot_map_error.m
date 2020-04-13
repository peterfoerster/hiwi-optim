function [] = plot_map_error (nx_it, nz_it, err_l2, err_linf);
   if (length(nx_it) == 1)
      figure(3);
      hold on;
      % plot(2.^nz_it, err_l2(1,:,1,1), 2.^nz_it, err_l2(1,:,2,1));
      plot(2.^nz_it, err_linf(1,:,1,1), 2.^nz_it, err_linf(1,:,2,1));
      xlabel('nz');
      ylabel('||\Delta x_{rms}||_\infty');
      hold off;

      figure(4);
      hold on;
      % plot(2.^nz_it, err_l2(1,:,1,2), 2.^nz_it, err_l2(1,:,2,2));
      plot(2.^nz_it, err_linf(1,:,1,2), 2.^nz_it, err_linf(1,:,2,2));
      xlabel('nz');
      ylabel('||\Delta \epsilon||_\infty');
      hold off;
   else
      figure(3);
      hold on;
      % plot(2.^nx_it, err_l2(:,1,1,1), 2.^nx_it, err_l2(:,1,2,1));
      plot(2.^nx_it, err_linf(:,1,1,1), 2.^nx_it, err_linf(:,1,2,1));
      xlabel('nx');
      ylabel('||\Delta x_{rms}||_\infty');
      hold off;

      figure(4);
      hold on;
      % plot(2.^nx_it, err_l2(:,1,1,2), 2.^nx_it, err_l2(:,1,2,2));
      plot(2.^nx_it, err_linf(:,1,1,2), 2.^nx_it, err_linf(:,1,2,2));
      xlabel('nx');
      ylabel('||\Delta \epsilon||_\infty');
      hold off;
end
