pkg load geopdes;

order  = 5;
N_ctrl = 6*(order-2);
x      = zeros(2*N_ctrl,1);

tic;
% positive differences are inside the allowed domain
fc = ctrl_constraint(x, order, N_ctrl);
fprintf('\nctrl_constraint: %d min\n', toc/60);
