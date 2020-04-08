function [] = plot_map_error (nz_it, nx_it, l1_err, l2_err, linf_err)
   % figure(1);
   % nz = 2.^nz_it;
   % for ip=1:6
   %    hold on;
   %    loglog(nz, l1_err(1:length(nz_it),ip));
   %    loglog(nz, l2_err(1:length(nz_it),ip));
   %    loglog(nz, linf_err(1:length(nz_it),ip));
   %    hold off;
   % end
   % legend('l_1', 'l_2', 'l_{\infty}');
   % xlabel('nz=nx');
   % ylabel('err');

   figure(2);
   nx = 2.^nx_it;
   for ip=1:6
      hold on;
      % loglog(nx, l1_err(length(nz_it)+1:length(nz_it)+length(nx_it),ip));
      % loglog(nx, l2_err(length(nz_it)+1:length(nz_it)+length(nx_it),ip));
      loglog(nx, linf_err(length(nz_it)+1:length(nz_it)+length(nx_it),ip));
      hold off;
   end
   legend('l_1', 'l_2', 'l_{\infty}');
   xlabel('nx');
   ylabel('err');
end
