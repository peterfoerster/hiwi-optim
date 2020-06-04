function [err_linf] = compute_astra_error ()
   % [x/y, xrms/emit]
   err_linf = NaN(2,2);

   astra = dlmread(['results/astra/sim/fine/' 'photogun.Xemit.001']);
   x_ref = [astra(:,1), astra(:,4), astra(:,6)*pi];
   astra = dlmread(['results/astra/sim/' 'photogun.Xemit.001']);
   x     = [astra(:,1), astra(:,4), astra(:,6)*pi];

   astra = dlmread(['results/astra/sim/fine/' 'photogun.Yemit.001']);
   y_ref = [astra(:,1), astra(:,4), astra(:,6)*pi];
   astra = dlmread(['results/astra/sim/' 'photogun.Yemit.001']);
   y     = [astra(:,1), astra(:,4), astra(:,6)*pi];

   figure(1);
   hold on;
   plot(x_ref(:,1), x_ref(:,2), x(:,1), x(:,2));
   plot(y_ref(:,1), y_ref(:,2), y(:,1), y(:,2));
   xlabel('z in m');
   ylabel('x_{rms} in mm');
   hold off;

   figure(2);
   hold on;
   plot(x_ref(:,1), x_ref(:,3), x(:,1), x(:,3));
   plot(y_ref(:,1), y_ref(:,3), y(:,1), y(:,3));
   xlabel('z in m');
   ylabel('\epsilon in mrad mm');
   hold off;

   err_x = (interp1(x(:,1), x(:,2:3), x_ref(:,1)) - x_ref(:,2:3)) ./ x_ref(:,2:3);
   ix    = ~isnan(err_x(:,1)) & ~isnan(err_x(:,2));
   err_x = err_x(ix,:);
   err_y = (interp1(y(:,1), y(:,2:3), y_ref(:,1)) - y_ref(:,2:3)) ./ y_ref(:,2:3);
   iy    = ~isnan(err_y(:,1)) & ~isnan(err_y(:,2));
   err_y = err_y(iy,:);

   err_linf(1,1) = norm(err_x(:,1), Inf);
   err_linf(1,2) = norm(err_x(:,2), Inf);
   err_linf(2,1) = norm(err_y(:,1), Inf);
   err_linf(2,2) = norm(err_y(:,2), Inf);
end
