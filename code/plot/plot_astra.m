function [] = plot_astra (filename)
   astra = dlmread([filename '.Yemit.001']);
   x = [astra(:,1), astra(:,4), astra(:,6)*pi];

   write_dat1D([filename '_rms.dat'], x(:,1), x(:,2));
   write_dat1D([filename '_eps.dat'], x(:,1), x(:,3));

   plot(x(:,1), x(:,2));
   hold on;
   plot(x(:,1), x(:,3));
   legend('x_{rms}', '\epsilon');
   xlabel('z/m');
   hold off;
end
