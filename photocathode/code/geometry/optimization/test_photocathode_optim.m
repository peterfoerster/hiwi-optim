pkg load geopdes;
clf;

order    = 3;
filename = ['photocathode_200kV_optim_order=' num2str(order)];
N_ctrl   = 4*(order-2);
x        = zeros(2*N_ctrl,1);

% test individual control points
% x(1) = 0.005;
% x(6)  = 0.005;
% x(7)  = -0.005;
% x(8)  = 0.005;
% x(9)  = -0.005;
% order=4
% x(20) = 0.005;
% order=5
% x(30) = 0.005;

tic;
create_photocathode_optim (filename, x, order);
fprintf('\ntime elapsed for creation: %d min\n', toc/60);
plot_mp(filename);
