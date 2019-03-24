% ptnl_sc_ref
clear all; close all; clc; addpath(genpath(pwd));
% computes the convergence of the potential solution against a very accurate solution

N_il = 3; % only go up to 5 for now, this already takes way too long, the runtime scales with the accuracy of the reference solution
degree_ref = 3;
nsub_ref = 2^N_il;
degree_conv = 2; % to test properly with higher degree
N_p = 1e4;
sigma = 1e-2;

geometry_file = 'square.txt'; % perform on short geometry
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load (geometry_file);

q = -1.602e-19;
r = [rand(2,N_p); zeros(1,N_p)];
voltage = 90e3;
src_type = 'none';

t_ptnl = zeros(1,N_il+1);
errh1 = zeros(1,N_il);
errl2 = zeros(1,N_il);
t_err = zeros(1,N_il);

% compute reference solution
problem_data.nmnn_sides   = [];
problem_data.drchlt_sides = [1,2,3,4];

problem_data.c_diff = @(x,y) 8.854e-12*ones(size(x));

problem_data.f = @(x,y) f_src_2D (x, y, src_type, q, r, sigma);
problem_data.g = @(x,y,ib) zeros(size(y));
problem_data.h = @(x,y,ib) zeros(size(x));

method_data.degree = [degree_ref,degree_ref];
method_data.regularity = [1,1];
method_data.nsub = [nsub_ref,nsub_ref];
method_data.nquad = [3,3]; %3 seems to suffice

tic;
[msh_ref, space_ref, u_ref] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);
t_ptnl(end) = toc;

% iterate while splitting h in half each step
method_data.degree = [degree_conv,degree_conv];
for iit=1:N_il
	method_data.nsub = [2,2].^iit;
	tic;
	[msh_conv, space_conv, u_conv] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);
	t_ptnl(iit) = toc;
	
	tic;
	[errh1(iit), errl2(iit), ~] = mp_sp_h1_error_ref (space_ref, msh_ref, u_ref, u_conv, space_conv, geometry);
	t_err(iit) = toc;
end

% save the results
save_file = ['ptnl_sc_ref', '_N_il=',num2str(N_il), '_degree_ref=',num2str(degree_ref), 'degree_conv=',num2str(degree_conv), '.mat'];
save(save_file, 'errh1', 'errl2', 'N_il', 'degree_ref', 'degree_conv', 't_ptnl', 't_err');
