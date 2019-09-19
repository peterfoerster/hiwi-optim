clear all; close all; clc;
pkg load geopdes;

N_inc = 1;
% total number of DOFs
N_ctrl = 12*N_inc+8;
x_ini = zeros(N_ctrl,1);

[lb, ub, ptcs] = compute_bounds (N_inc, N_ctrl, x_ini);
[x, y] = compute_ctrl_coords (N_inc, ptcs);
[lb, ub] = compute_bounds_diff (N_inc, x, y, lb, ub);

% global:
% Lagrangian: DIRECT, CRS, MLSL
% AGS, ISRES, ESCH

% local:
% Lagrangian: BOBYQA, Sbplx
% solo: COBYLA

% nlopt interface
opt.algorithm     = NLOPT_AUGLAG;
opt.n             = N_ctrl;
opt.min_objective = @cost_function;
opt.lower_bounds  = lb;
opt.upper_bounds  = ub;
opt.fc            = {@volume_constraint_nlopt};
% set lower maxtime, almost no change after around 100 evaluations
opt.maxtime       = 2*60*60;
opt.verbose       = 1;
opt.local_optimizer.algorithm = NLOPT_LN_BOBYQA;
% opt.local_optimizer.ftol_rel  = sqrt(eps);

[x_opt, obj, retcode] = nlopt_optimize (opt, x_ini);

save(['result_nloptim_N_inc=' num2str(N_inc) '.mat'], 'x_opt', 'obj', 'retcode');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
