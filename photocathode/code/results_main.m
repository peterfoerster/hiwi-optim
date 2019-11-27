clear all; close all; clc;
pkg load geopdes;

% obj, x_opt
filename = 'result_nloptim_order=3_run12_newgeometry_noholes';
load([filename '.mat']);
order    = 3;
N_ctrl   = 5*(order-2);
x        = zeros(2*N_ctrl,1);

% volume constraint
volume_constraint_orig  = volume_constraint(x, order);
volume_constraint_optim = volume_constraint(x_opt, order);

% cost function
[obj_orig] = cost_function_max (x, order);

% absolute maximum
[max_orig]  = cost_function_abs_max (x, order);
[max_optim] = cost_function_abs_max (x_opt, order);

save([filename '_eval.mat'], 'volume_constraint_orig', 'volume_constraint_optim', 'obj_orig', 'obj', 'max_orig', 'max_optim');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
