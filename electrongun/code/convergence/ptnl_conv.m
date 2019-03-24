% tested

% ptnl_conv
clear all;
close all;
clc;
addpath(genpath(pwd));

N_il = 3; % fairly quick until 6
save_file = ['ptnl_conv_N_il=',num2str(N_il),'.mat'];

geometry_file = 'gun_half_long.txt'

[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load (geometry_file);
sigma = 1e-2;
q = -1.602e-19;
r = 1;
voltage = 90e3;
src_type = 'none';

t_ptnl = zeros(1,N_il+1);
errh1 = zeros(1,N_il);
errl2 = zeros(1,N_il);
t_err = zeros(1,N_il);

[problem_data, method_data] = init_ptnl_2D (src_type, q, r, sigma, voltage);
method_data.nsub = [1,1];
method_data.nquad = [3,3];
tic;
[msh_old, space_old, u_old] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);
t_ptnl(1) = toc;

for iit=1:N_il
	method_data.nsub = [2,2].^iit;
	tic;
	[msh_new, space_new, u_new] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);
	t_ptnl(iit+1) = toc;
	
	tic;
	[errh1(iit), errl2(iit), ~] = mp_sp_h1_error_mod (space_old, msh_new, u_old, u_new, space_new, geometry, method_data.nsub);
	t_err(iit) = toc;
	space_old = space_new;
	u_old = u_new;
end

save(save_file, 'errh1', 'errl2', 'N_il', 'method_data', 't_ptnl', 't_err');
