function [] = plot_int_error (H_ref, H_it, l1_err, l2_err, linf_err)
   H = 2.^H_it;
   for ip=1:6
      hold on;
      loglog(H, l1_err(:,ip));
      loglog(H, l2_err(:,ip));
      loglog(H, linf_err(:,ip));
      hold off;
   end
   legend('l_1', 'l_2', 'l_{\infty}');
   xlabel('H');
   ylabel('err');
end
