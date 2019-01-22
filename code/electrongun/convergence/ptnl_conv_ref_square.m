% ptnl_conv_ref
clear all; close all; clc; addpath(genpath(pwd));
% computes the convergence of the potential solution against a very accurate solution

N_il = 3; % only go up to 5 for now, this already takes way too long, the runtime scales with the accuracy of the reference solution
degree_ref = 3;
nsub_ref = 2^N_il;
nquad_ref = 5;
degree_conv = 5; % to test properly with higher degree

geometry_file = 'square.txt'; % perform on short geometry
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load (geometry_file);

%sigma = 1e-2;
%q = -1.602e-19;
%r = 1;
voltage = 90e3;
%src_type = 'none';

t_ptnl = zeros(1,N_il+1);
errh1 = zeros(1,N_il);
errl2 = zeros(1,N_il);
t_err = zeros(1,N_il);

% compute reference solution
problem_data.nmnn_sides   = [3,4];
problem_data.drchlt_sides = [1,2];

problem_data.c_diff = @(x,y) 8.854e-12*ones(size(x));

problem_data.f = @(x,y) zeros( size(x) );
problem_data.g = @(x,y,ib) zeros( size(x) );
problem_data.h = @(x,y) x + y;

method_data.degree = [2,2];
method_data.regularity = [1,1];
method_data.nsub = [4,4];
method_data.nquad = [5,5]; %small improvement with 4, but worth the effort?

method_data.degree = [degree_ref,degree_ref];
method_data.nsub = [nsub_ref,nsub_ref];
method_data.nquad = [nquad_ref,nquad_ref];

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
save_file = ['ptnl_conv_square_nquad=5', '_N_il=',num2str(N_il), '_degree_ref=',num2str(degree_ref), 'degree_conv=',num2str(degree_conv), '.mat'];
save(save_file, 'errh1', 'errl2', 'N_il', 'degree_ref', 'degree_conv', 't_ptnl', 't_err');
