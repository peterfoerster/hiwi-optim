% Computes the important quantities for the initial and optimized geometry.

filename = 'result_nlopt_order=8_run6';
order = 8;
% [x_opt]
load('result_ls_fit_init.mat');

if (order < 8)
    N_ctrl = order+2;
elseif (order >= 8)
    N_ctrl = order-3;
end
x_init = x_opt;
load([filename '.mat']);

% optimized NURBS
% write_ctrl_opt (order, x_opt);

% volume constraint (+1 cm^3)
volume_constraint_orig = volume_constraint_orig('electrode_v6_orig');
volume_constraint_init = volume_constraint(x_init, order);
volume_constraint_opt  = volume_constraint(x_opt, order);

% cost function
% [obj_init] = cost_function_max (x_init, order);
% [obj_opt]  = cost_function_max (x_opt, order);

% absolute maximum
[max_orig] = cost_function_abs_max_orig ('geometry_v6_orig');
[max_init] = cost_function_abs_max (x_init, order);
[max_opt]  = cost_function_abs_max (x_opt, order);

save([filename '_eval.mat'], 'volume_constraint_orig', 'volume_constraint_init', 'volume_constraint_opt', ...
                             'max_orig', 'max_init', 'max_opt');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
