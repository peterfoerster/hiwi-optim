pkg load geopdes;
clf;

order  = 3;
N_ctrl = 5*(order-2);
x      = zeros(2*N_ctrl,1);

tic;
% positive differences are inside the allowed domain
fc = ctrl_constraint(x, order, N_ctrl)
fprintf('\n control constraint %d min \n', toc/60);
