clear all; close all; clc;
pkg load geopdes;

order  = 4;
N_ctrl = 4*(order-2);
x_ini  = zeros(2*N_ctrl,1);

[lb, ub] = compute_bounds (x_ini, order, 2*N_ctrl);

% global:
% solo: ISRES
% local:
% solo: COBYLA

% nlopt interface
opt.algorithm     = NLOPT_LN_COBYLA;
opt.maxeval       = 500;
opt.maxtime       = 36*60*60;

% opt.algorithm     = NLOPT_GN_ISRES;
% opt.population    = ;
% opt.maxeval       = ;
% opt.maxtime       = 7*24*60*60;

opt.min_objective = @(x) cost_function_max(x, order);
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {@(x) volume_constraint(x, order), @(x) ctrl_constraint(x, order, N_ctrl)};
opt.verbose       = 1;

tic;
[x_opt, obj, retcode] = nlopt_optimize (opt, x_ini);
fprintf('\ntime elapsed for optimization: %d min\n', toc/60);

save(['result_nloptim_order=' num2str(order) '.mat'], 'x_opt', 'obj', 'retcode');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
