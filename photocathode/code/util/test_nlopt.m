clear all; close all; clc;

% nlopt interface, need to use augmented Lagrangian for constraint
opt.algorithm     = NLOPT_LN_BOBYQA;
opt.min_objective = @(x) x^2;
% opt.maxtime       = 4e-4;
% opt.maxeval       = 4;
% opt.stopval       = 1e-2;
opt.verbose       = 1;

[x_opt, obj, retcode] = nlopt_optimize (opt, 10);
