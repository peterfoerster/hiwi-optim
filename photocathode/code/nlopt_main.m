clear all; close all; clc;
pkg load geopdes;

order  = 3;
N_ctrl = 13*(order-2) - 2;
x_ini  = zeros(N_ctrl,1);

[lb, ub] = compute_bounds (x_ini, order, N_ctrl);

% global:
% Lagrangian: DIRECT, CRS, MLSL
% AGS, ISRES, ESCH

% local:
% Lagrangian: BOBYQA, Sbplx
% solo: COBYLA

% nlopt interface
opt.algorithm     = NLOPT_AUGLAG;
opt.n             = N_ctrl;
opt.min_objective = @(x) cost_function(x, order);
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {@(x) volume_constraint_nlopt(x, order)};
opt.verbose       = 1;
opt.local_optimizer.algorithm = NLOPT_LN_BOBYQA;
opt.local_optimizer.ftol_rel  = 1e-6;
opt.local_optimizer.maxeval   = 100;

[x_opt, obj, retcode] = nlopt_optimize (opt, x_ini);

save(['result_nloptim_order=' num2str(order) '.mat'], 'x_opt', 'obj', 'retcode');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
