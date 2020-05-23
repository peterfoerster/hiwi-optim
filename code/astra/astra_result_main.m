% integrator
% H_ref = -13;
% H_it  = [-8 -9 -10 -11 -12 -13];
%
% [err_linf] = compute_int_error (H_ref, H_it);

% fieldmap
nx_ref = 4;
nz_ref = 8;
nx_it  = [4];
nz_it  = [4 5 6 7];

nx_ref = 6;
nz_ref = 6;
nx_it  = [3 4 5];
nz_it  = [6];

[err_linf] = compute_map_error (nx_ref, nz_ref, nx_it, nz_it);
return
% space charge
nI_ref = 10;
nr_ref = 5;
nc_ref = 1;
nl_ref = 5;
nI_it  = [10];
nr_it  = [2 3 4 5];
nc_it  = [1];
nl_it  = [2 3 4 5];

nI_ref = 13;
nr_ref = 4;
nc_ref = 1;
nl_ref = 4;
nI_it  = [8 9 10 11 12];
nr_it  = [4];
nc_it  = [1];
nl_it  = [4];

nI_ref = 10;
nr_ref = 4;
nc_ref = 2;
nl_ref = 4;
nI_it  = [10];
nr_it  = [4];
nc_it  = [-1 1 2];
nl_it  = [4];

[err_linf] = compute_sc_error (nI_ref, nr_ref, nc_ref, nl_ref, nI_it, nr_it, nc_it, nl_it);
