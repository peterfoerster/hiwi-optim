order  = 3;
N_ctrl = 4*(order-2);
x      = zeros(2*N_ctrl,1);

% test individual control points
% x(3)  = -0.005;
% x(7)  = -0.005;
% x(8)  = 0.005;
% x(9)  = -0.005;
% x(10) = 0.005;

tic;
cost_function = @(x) cost_function_max(x, order);
[obj] = cost_function (x)
fprintf('\ntime elapsed for solution: %d min\n', toc/60);
