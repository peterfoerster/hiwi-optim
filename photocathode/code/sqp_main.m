clear all; close all; clc;
pkg load geopdes;

order  = 3;
N_ctrl = 13*(order-2) - 2;
x_ini  = zeros(N_ctrl,1);

[lb, ub] = compute_bounds (x_ini, order, N_ctrl);

maxiter = 10;
[x_opt, obj, info, iter, nf, lambda] = sqp_mod (x_ini, @(x )cost_function(x, order), [], @(x) volume_constraint(x, order), lb, ub, maxiter);

save(['result_optim_order=' num2str(order) '.mat'], 'x_opt', 'obj', 'info', 'iter', 'nf', 'lambda');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
