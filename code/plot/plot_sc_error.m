function [] = plot_sc_error (nI_it, nr_it, nc_it, nl_it, err_linf);
   if (length(nI_it) == 1 & length(nc_it) == 1)
      for inr=1:length(nr_it)
         figure(inr+2);
         hold on;
         plot(2.^nl_it, squeeze(err_linf(1,inr,1,:,1,1)), 2.^nl_it, squeeze(err_linf(1,inr,1,:,2,1)));
         xlabel('nl');
         ylabel('||\Delta x_{rms}||_\infty');
         hold off;

         figure(inr+length(nr_it)+2);
         hold on;
         plot(2.^nl_it, squeeze(err_linf(1,inr,1,:,1,2)), 2.^nl_it, squeeze(err_linf(1,inr,1,:,2,2)));
         xlabel('nl');
         ylabel('||\Delta \epsilon||_\infty');
         hold off;
      end
   elseif (length(nr_it) == 1 & length(nc_it) == 1 & length(nl_it) == 1)
      figure(3);
      hold on;
      plot(2.^nI_it, squeeze(err_linf(:,1,1,1,1,1)), 2.^nI_it, squeeze(err_linf(:,1,1,1,2,1)));
      xlabel('nl');
      ylabel('||\Delta x_{rms}||_\infty');
      hold off;

      figure(4);
      hold on;
      plot(2.^nI_it, squeeze(err_linf(:,1,1,1,1,2)), 2.^nI_it, squeeze(err_linf(:,1,1,1,2,2)));
      xlabel('nl');
      ylabel('||\Delta \epsilon||_\infty');
      hold off;
end
