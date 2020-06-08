% Compute the volume constraint on the electrode.
order = 5;


if (order == 3)
    N_ctrl = 6*1;
elseif (order == 4)
    N_ctrl = 2*1 + 1*2 + 2*1;
elseif (order == 5)
    N_ctrl = 2*1 + 1*3 + 2*1;
end
x = zeros(2*N_ctrl,1);

tic;
vol_cstr = @(x) volume_constraint(x, order);
fc       = vol_cstr(x);
fprintf('\nvolume_constraint: %d min\n', toc/60);
