function [] = plot_astra (filename, geometry, N_probe)
   astra = dlmread(filename);
   x = astra(:,3:5);
   [theta, rho] = cart2pol(x(:,2), x(:,3));
   x = [x(:,1) rho];

   % iptc = [6 4 3 2 1];
   % for ii=iptc
   %    hold on;
   %    nrbkntplot(geometry(ii).nurbs);
   %    hold on;
   % end

   for ip=1:N_probe
      ix = find(astra(:,1) == ip);
      hold on;
      plot(x(ix,1), x(ix,2)*1e-3);
      [rho_min, imin] = min(x(ix,2));
      scatter(x(ix(imin),1), x(ix(imin),2)*1e-3, 'filled');
      hold off;
   end

   xlabel('z');
   ylabel('rho');
   view(2);
end
