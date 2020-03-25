order    = 3;
N_ctrl   = 4*(order-2);
x        = zeros(2*N_ctrl,1);

% test individual control points
% x(3)  = -0.005;
% x(7)  = -0.005;
% x(8)  = 0.005;
% x(9)  = -0.005;
% x(10) = 0.005;

tic;
volume_constraint = @(x) volume_constraint(x, order);
[fc] = volume_constraint(x)
fprintf('\ntime elapsed for solution: %d min\n', toc/60);
