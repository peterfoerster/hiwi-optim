order  = 3;
N_ctrl = 6*(order-2);
x      = zeros(2*N_ctrl,1);

tic;
vol_cstr = @(x) volume_constraint(x, order);
fc       = vol_cstr(x);
fprintf('\n volume constraint %d min\n', toc/60);
