% Computes the important quantities for the initial and optimized geometry.
% contains the optimized DoFs in [x_opt]
filename = 'result_nlopt_order=4_run1';
order = 8;

load([filename '.mat']);
if (order < 8)
    N_ctrl = order+2;
elseif (order >= 8)
    N_ctrl = order-3;
end
x_init = zeros(2*N_ctrl,1);

% optimized NURBS
% write_ctrl_opt (order, x_opt);

% volume constraint
volume_constraint_init = volume_constraint(x_init, order);
volume_constraint_opt  = volume_constraint(x_opt, order);

% cost function
[obj_init] = cost_function_max (x_init, order);
[obj_opt]  = cost_function_max (x_opt, order);

% absolute maximum
[max_init] = cost_function_abs_max (x_init, order);
[max_opt]  = cost_function_abs_max (x_opt, order);

save([filename '_eval.mat'], 'volume_constraint_init', 'volume_constraint_opt', ...
      'obj_init', 'obj_opt', 'max_init', 'max_opt');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
