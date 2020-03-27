function [] = plot_astra (filename, geometry, N_probe)
   astra = dlmread(filename);
   x = astra(:,3:5);

   % iptc = [6 4 3 2 1];
   % for ii=iptc
   %    hold on;
   %    nrbkntplot(geometry(ii).nurbs);
   %    hold on;
   % end

   for ip=1:N_probe
      ix = find(astra(:,1) == ip);
      hold on;
      plot3(x(ix,1), x(ix,3)*1e-3, x(ix,2)*1e-3);
      [xmin, imin]  = min(abs(x(ix,2)));
      [ymin, iminy] = min(abs(x(ix,3)));
      if (xmin < ymin)
         scatter3(x(ix(imin),1), x(ix(imin),3)*1e-3, x(ix(imin),2)*1e-3, 'filled');
      else
         scatter3(x(ix(iminy),1), x(ix(iminy),3)*1e-3, x(ix(iminy),2)*1e-3, 'filled');
      end
      hold off;
   end

   xlabel('z');
   ylabel('y');
   zlabel('x');
   view(2);
end
