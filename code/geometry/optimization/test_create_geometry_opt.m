pkg load geopdes;
clf;

order    = 5;
filename = ['v6_opt_order=' num2str(order)];
N_ctrl   = 5*(order-2);
x        = zeros(2*N_ctrl,1);

tic;
create_geometry_opt (filename, x, order);
fprintf('\n geometry_opt %d min \n', toc/60);

geometry = mp_geo_load ([geometry_file '.txt']);
for iptc=1:length(geometry)
   hold on;
   nrbplot(geometry(iptc).nurbs, [8 8]);
   hold off;
end
shading interp;
