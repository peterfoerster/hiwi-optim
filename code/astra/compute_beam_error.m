function [l1_err, l2_err, linf_err] = compute_beam_error (nz_ref, nz_it, nx_it)
   l1_err   = NaN(length(nz_it)+length(nx_it),2);
   l2_err   = NaN(length(nz_it)+length(nx_it),2);
   linf_err = NaN(length(nz_it)+length(nx_it),2);

   filename = ['photogun_nx=ny=' num2str(2^nz_ref) '_nz=' num2str(2^nz_ref) '.Xemit.001'];
   x_ref = dlmread(filename);
   x_ref = [x_ref(:,1) x_ref(:,4)*1e-3];
   filename = ['photogun_nx=ny=' num2str(2^nz_ref) '_nz=' num2str(2^nz_ref) '.Yemit.001'];
   y_ref = dlmread(filename);
   y_ref = [y_ref(:,1) y_ref(:,4)*1e-3];

   % emittance (*pi?)
   hold on;
   plot(x_ref(:,1), x_ref(:,2));
   plot(y_ref(:,1), y_ref(:,2));
   hold off;

      % for in=1:length(nz_it)
      %    nz = 2^nz_it(in);
      %    filename = ['photogun_nx=ny=' num2str(nz) '_nz=' num2str(nz) '.Xemit.001'];
      %    x_it = dlmread(filename);
      %    x_it = [x_it(:,1) x_it(:,4)*1e-3];
      %    filename = ['photogun_nx=ny=' num2str(nz) '_nz=' num2str(nz) '.Yemit.001'];
      %    y_it = dlmread(filename);
      %    y_it = [y_it(:,1) y_it(:,4)*1e-3];
      %
      %    err_x = interp1(x_it(:,1), x_it(:,2), x_ref(:,1)) - x_ref(:,2);
      %    ix  = ~isnan(err_x);
      %    err_x = err_x(ix,:);
      %    err_y = interp1(y_it(:,1), y_it(:,2), y_ref(:,1)) - y_ref(:,2);
      %    iy  = ~isnan(err_y);
      %    err_y = err_y(iy,:);
      %
      %    l1_err(in,1)   = norm(err_x, 1);
      %    l2_err(in,1)   = norm(err_x, 2);
      %    linf_err(in,1) = norm(err_x, Inf);
      %    l1_err(in,2)   = norm(err_y, 1);
      %    l2_err(in,2)   = norm(err_y, 2);
      %    linf_err(in,2) = norm(err_y, Inf);
      %
      %    hold on;
      %    plot(x_it(:,1), x_it(:,2));
      %    plot(y_it(:,1), y_it(:,2));
      %    hold off;
      % end

      for in=1:length(nx_it)
         nx = 2^nx_it(in);
         filename = ['photogun_nx=ny=' num2str(nx) '_nz=' num2str(2^nz_ref) '.Xemit.001'];
         x_it = dlmread(filename);
         x_it = [x_it(:,1) x_it(:,4)*1e-3];
         filename = ['photogun_nx=ny=' num2str(nx) '_nz=' num2str(2^nz_ref) '.Yemit.001'];
         y_it = dlmread(filename);
         y_it = [y_it(:,1) y_it(:,4)*1e-3];

         err_x = interp1(x_it(:,1), x_it(:,2), x_ref(:,1)) - x_ref(:,2);
         ix  = ~isnan(err_x);
         err_x = err_x(ix,:);
         err_y = interp1(y_it(:,1), y_it(:,2), y_ref(:,1)) - y_ref(:,2);
         iy  = ~isnan(err_y);
         err_y = err_y(iy,:);

         l1_err(length(nz_it)+in,1)   = norm(err_x, 1);
         l2_err(length(nz_it)+in,1)   = norm(err_x, 2);
         linf_err(length(nz_it)+in,1) = norm(err_x, Inf);
         l1_err(length(nz_it)+in,2)   = norm(err_y, 1);
         l2_err(length(nz_it)+in,2)   = norm(err_y, 2);
         linf_err(length(nz_it)+in,2) = norm(err_y, Inf);

         hold on;
         plot(x_it(:,1), x_it(:,2));
         plot(y_it(:,1), y_it(:,2));
         hold off;
      end
end
