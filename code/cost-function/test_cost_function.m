% computes the cost function for the optimization
order = 4;

if (order == 3)
    N_ctrl = 6*1;
elseif (order == 4)
    N_ctrl = 2*1 + 1*2 + 2*1;
elseif (order == 5)
    N_ctrl = 2*1 + 1*3 + 2*1;
end
x = zeros(2*N_ctrl,1);

tic;
cst_func = @(x) cost_function_max(x, order);
[obj] = cst_func(x)
fprintf('\ncost_function_max: %d min\n', toc/60);
