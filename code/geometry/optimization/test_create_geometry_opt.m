% 
order    = 3;
filename = ['v6_opt_order=' num2str(order)];
N_ctrl   = 6*(order-2);
x        = zeros(2*N_ctrl,1);

tic;
create_geometry_opt (filename, x, order);
fprintf('\ncreate_geometry_opt: %d min\n', toc/60);

geometry = mp_geo_load ([filename '.txt']);
for iptc=1:length(geometry)
   hold on;
   nrbplot(geometry(iptc).nurbs, [8 8]);
   hold off;
end
shading interp;

figure;
geometry = mp_geo_load ('electrode_v6.txt');
for iptc=1:length(geometry)
   hold on;
   nrbplot(geometry(iptc).nurbs, [8 8]);
   hold off;
end
shading interp;
