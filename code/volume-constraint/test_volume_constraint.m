% Compute the volume constraint on the electrode.
order = 3;

N_ctrl = order+2;
x = zeros(2*N_ctrl,1);

tic;
vol_cstr = @(x) volume_constraint(x, order);
fc       = vol_cstr(x);
fprintf('\nvolume_constraint: %d min\n', toc/60);
