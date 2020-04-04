pkg load geopdes;
clf;

order    = 5;
filename = ['v6_opt_order=' num2str(order)];
N_ctrl   = 5*(order-2);
x        = zeros(2*N_ctrl,1);

% test individual control points
% x(1) = 0.005;
% x(6)  = 0.005;
% x(7)  = -0.005;
% x(8)  = 0.005;
% x(10)  = -0.005;
% order=4
% x(20) = 0.005;
% order=5
% x(30) = 0.005;
% order=7
% x(40) = 0.005;

tic;
create_geometry_opt (filename, x, order);
fprintf('\ntime elapsed for creation: %d min\n', toc/60);

geometry = mp_geo_load ([geometry_file '.txt']);
for iptc=1:length(geometry)
   hold on;
   nrbplot(geometry(iptc).nurbs, [8 8]);
   hold off;
end
shading interp;
