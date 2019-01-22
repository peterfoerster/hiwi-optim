geometry_file = "gun_half_short.txt";
voltage = 90e3;
[problem_data, method_data] = init_ptnl_2D (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);

%res_x = res_y = 10;
%plot_potential_2D (res_x, res_y, u, space, geometry);

% choose physical coordinates
% z is longitudinal axis so no phi(z,y,0)
Nx = 0;
Ny = 25;
Nz = 25;
% transform to parametric coordinates

% compute e-field

% write to files
