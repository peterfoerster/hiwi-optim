% eval_ptnl_conv
clear all;close all;clc;

load("ptnl_conv_ref_N_il=5_degree_ref=3degree_conv=2_nquad=4.mat");
geometry_file = 'gun_half_short.txt';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load (geometry_file);
% compute reference solution
nsub_ref = 2^N_il;
sigma = 1e-2;
q = -1.602e-19;
r = 1;
voltage = 90e3;
src_type = 'none';
[problem_data, method_data] = init_ptnl_2D (src_type, q, r, sigma, voltage);
method_data.degree = [degree_ref,degree_ref];
method_data.nsub = [nsub_ref,nsub_ref];
[msh_ref, space_ref, u_ref] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);
sp_plot_solution (u_ref, space_ref, geometry, [5,5]);
return

h = 2.^-(1:N_il);
p = degree_conv;

loglog(h,errh1, h,errl2);
legend("h1","theoretical rate");
%hold on;
%figure
%loglog(h,errl2, h,h.^(p+1));
%legend("l2","theoretical rate");

%legend("h1", "l2");
%cleanfigure;
%matlab2tikz("ptnl_conv_ref_N_il=3_degree_ref=3degree_conv=2.tex");


% compute slope averaged over entire interval
d_h1 = log(errh1(1)/errh1(end)); 
d_l2 = log(errl2(1)/errl2(end));
dh = log(h(1)/h(end));

s_h1 = d_h1/dh
s_l2 = d_l2/dh
hold on;
%plot(h, errh1(1)*h.^s_h1);
return
s_h1 = log( errh1(2:end)-errh1(1:end-1) )./log( h(2:end)-h(1:end-1) )
s_h1 = sum(s_h1)/length(s_h1)
%return
%
s_l2 = log( errl2(2:end)-errl2(1:end-1) )./log( h(2:end)-h(1:end-1) )
s_l2 = sum(s_l2)/length(s_l2)
