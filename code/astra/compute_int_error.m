function [err_linf] = compute_int_error (H_ref, H_it)
   % [H_it, x/y, xrms/emit]
   err_linf = NaN(length(H_it),2,2);

   filename = ['photogun_H=' num2str(H_ref) '.Xemit.001'];
   x_ref = dlmread(filename);
   x_ref = [x_ref(:,1) x_ref(:,4) x_ref(:,6)*pi];

   filename = ['photogun_H=' num2str(H_ref) '.Yemit.001'];
   y_ref = dlmread(filename);
   y_ref = [y_ref(:,1) y_ref(:,4) y_ref(:,6)*pi];

   % figure(1);
   % hold on;
   % plot(x_ref(:,1), x_ref(:,2));
   % plot(y_ref(:,1), y_ref(:,2));
   % xlabel('z/m');
   % ylabel('x_{rms}/mm');
   % hold off;

   figure(2);
   hold on;
   % plot(x_ref(:,1), x_ref(:,3));
   plot(y_ref(:,1), y_ref(:,3));
   write_dat1D ('photogun_int_emit_ref.dat', y_ref(:,1), y_ref(:,3));
   xlabel('z/m');
   ylabel('\epsilon/(mrad mm)');
   hold off;

   for iH=1:length(H_it)
      filename = ['photogun_H=' num2str(H_it(iH)) '.Xemit.001'];
      x_it = dlmread(filename);
      x_it = [x_it(:,1) x_it(:,4) x_it(:,6)*pi];
      filename = ['photogun_H=' num2str(H_it(iH)) '.Yemit.001'];
      y_it = dlmread(filename);
      y_it = [y_it(:,1) y_it(:,4) y_it(:,6)*pi];

      err_x = interp1(x_it(:,1), x_it(:,2:3), x_ref(:,1)) - x_ref(:,2:3);
      ix    = ~isnan(err_x(:,1)) & ~isnan(err_x(:,2));
      err_x = err_x(ix,:);
      err_y = interp1(y_it(:,1), y_it(:,2:3), y_ref(:,1)) - y_ref(:,2:3);
      iy    = ~isnan(err_y(:,1)) & ~isnan(err_y(:,2));
      err_y = err_y(iy,:);

      % err_linf(iH,1,1) = norm(err_x(:,1), Inf);
      % err_linf(iH,1,2) = norm(err_x(:,2), Inf);
      % err_linf(iH,2,1) = norm(err_y(:,1), Inf);
      err_linf(iH,2,2) = norm(err_y(:,2), Inf);

      % figure(1);
      % hold on;
      % plot(x_it(:,1), x_it(:,2));
      % plot(y_it(:,1), y_it(:,2));
      % hold off;

      figure(2);
      hold on;
      % plot(x_it(:,1), x_it(:,3));
      plot(y_it(:,1), y_it(:,3));
      write_dat1D (['photogun_int_emit_H_it=' num2str(H_it(iH)) '.dat'], y_it(:,1), y_it(:,3));
      hold off;
   end
   write_dat1D ('photogun_int_err.dat', 2.^H_it, err_linf(:,2,2));
end
