order  = 3;
N_ctrl = 4*(order-2);
x      = zeros(2*N_ctrl,1);

% positive differences are inside the correct domain
% only use minimum difference as constraint function
% test individual control points
% x(1) = 0.005;

tic;
fc = ctrl_constraint(x, order, N_ctrl)
fprintf('\ntime elapsed for solution: %d min\n', toc/60);
