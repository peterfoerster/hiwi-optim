clear all; close all; clc;
pkg load geopdes;

N_inc = 1;
% total number of DOFs
N_ctrl = 12*N_inc+8;
x_ini = zeros(N_ctrl,1);
[lb, ub] = compute_bounds (N_inc, N_ctrl, x_ini);
return
maxiter = 10;
[x_opt, obj, info, iter, nf, lambda] = sqp_mod (x_ini, @cost_function, [], @volume_constraint, lb, ub, maxiter);
% [x_opt, obj, info, iter, nf, lambda] = sqp (x_ini, @cost_function, [], @volume_constraint, lb, ub, maxiter, tol);

save(['result_optim_N_inc=' num2str(N_inc) '.mat'], 'x_opt', 'obj', 'info', 'iter', 'nf', 'lambda');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
