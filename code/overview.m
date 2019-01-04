addpath(genpath(pwd));
geometry_file = "gun_half_short.txt";

%nsub = 5;
%width = 8;
%options.numbers = 1;
%options.boundary = 1;
%plot_geometry_2D (geometry_file, nsub, width, options);

voltage = 90e3;
[problem_data, method_data] = init_ptnl_2D (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);
res_x = res_y = 10;
plot_potential_2D (res_x, res_y, u, space, geometry);
