% contains the optimized DoFs in [x]
filename = 'result_opt_order=3_run2';
load([filename '.mat']);
order  = 3;
N_ctrl = 6*(order-2);
x_init = zeros(2*N_ctrl,1);

% volume constraint
volume_constraint_init = volume_constraint(x_init, order);
volume_constraint_opt  = volume_constraint(x, order);

% cost function
[obj_init] = cost_function_max (x_init, order);
[obj_opt]  = cost_function_max (x, order);

% absolute maximum
[max_init] = cost_function_abs_max (x_init, order);
[max_opt]  = cost_function_abs_max (x, order);

save([filename '_eval.mat'], 'volume_constraint_init', 'volume_constraint_opt', ...
      'obj_init', 'obj_opt', 'max_init', 'max_opt');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
