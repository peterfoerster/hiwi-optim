function [err_l2, err_linf] = compute_map_error (nx_ref, nz_ref, nx_it, nz_it)
   % [nx_it, nz_it, x/y, xrms/emit]
   err_l2   = NaN(length(nx_it),length(nz_it),2,2);
   err_linf = NaN(length(nx_it),length(nz_it),2,2);

   filename = ['photogun_nx=ny=' num2str(2^nx_ref) '_nz=' num2str(2^nz_ref) '.Xemit.001'];
   x_ref = dlmread(filename);
   % normalized emittance (*pi?)
   x_ref = [x_ref(:,1) x_ref(:,4) x_ref(:,6)*pi];
   filename = ['photogun_nx=ny=' num2str(2^nx_ref) '_nz=' num2str(2^nz_ref) '.Yemit.001'];
   y_ref = dlmread(filename);
   y_ref = [y_ref(:,1) y_ref(:,4) y_ref(:,6)*pi];

   figure(1);
   hold on;
   % plot(x_ref(:,1), x_ref(:,2));
   plot(y_ref(:,1), y_ref(:,2));
   xlabel('z/m');
   ylabel('x_{rms}');
   hold off;

   figure(2);
   hold on;
   % plot(x_ref(:,1), x_ref(:,3));
   plot(y_ref(:,1), y_ref(:,3));
   xlabel('z/m');
   ylabel('\epsilon');
   hold off;

   for inx=1:length(nx_it)
      for inz=1:length(nz_it)
         nx = 2^nx_it(inx);
         nz = 2^nz_it(inz);
         filename = ['photogun_nx=ny=' num2str(nx) '_nz=' num2str(nz) '.Xemit.001'];
         x_it = dlmread(filename);
         x_it = [x_it(:,1) x_it(:,4) x_it(:,6)*pi];
         filename = ['photogun_nx=ny=' num2str(nx) '_nz=' num2str(nz) '.Yemit.001'];
         y_it = dlmread(filename);
         y_it = [y_it(:,1) y_it(:,4) y_it(:,6)*pi];

         err_x = interp1(x_it(:,1), x_it(:,2:3), x_ref(:,1)) - x_ref(:,2:3);
         ix    = ~isnan(err_x(:,1)) & ~isnan(err_x(:,2));
         err_x = err_x(ix,:);
         err_y = interp1(y_it(:,1), y_it(:,2:3), y_ref(:,1)) - y_ref(:,2:3);
         iy    = ~isnan(err_y(:,1)) & ~isnan(err_y(:,2));
         err_y = err_y(iy,:);

         err_l2(inx,inz,1,1) = norm(err_x(:,1), 2);
         err_l2(inx,inz,1,2) = norm(err_x(:,2), 2);
         err_l2(inx,inz,2,1) = norm(err_y(:,1), 2);
         err_l2(inx,inz,2,2) = norm(err_y(:,2), 2);

         err_linf(inx,inz,1,1) = norm(err_x(:,1), Inf);
         err_linf(inx,inz,1,2) = norm(err_x(:,2), Inf);
         err_linf(inx,inz,2,1) = norm(err_y(:,1), Inf);
         err_linf(inx,inz,2,2) = norm(err_y(:,2), Inf);

         figure(1);
         hold on;
         % plot(x_it(:,1), x_it(:,2));
         plot(y_it(:,1), y_it(:,2));
         hold off;

         figure(2);
         hold on;
         % plot(x_it(:,1), x_it(:,3));
         plot(y_it(:,1), y_it(:,3));
         hold off;
      end
   end
end
