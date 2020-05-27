function [] = plot_astra (filename)
   scale = 10;
   astra = dlmread([filename '.Xemit.001']);
   x = [astra(:,1), astra(:,4), astra(:,6)*pi];

   write_dat1D([filename '_Xrms.dat'], x(:,1), scale*x(:,2));
   write_dat1D([filename '_Xeps.dat'], x(:,1), x(:,3));

   astra = dlmread([filename '.Yemit.001']);
   x = [astra(:,1), astra(:,4), astra(:,6)*pi];

   write_dat1D([filename '_Yrms.dat'], x(:,1), scale*x(:,2));
   write_dat1D([filename '_Yeps.dat'], x(:,1), x(:,3));

   plot(x(:,1), x(:,2));
   hold on;
   plot(x(:,1), x(:,3));
   legend('x_{rms}', '\epsilon');
   xlabel('z/m');
   hold off;
end
