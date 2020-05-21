pkg load geopdes;

% geometry_file = 'geometry_v6';
% geometry_file = 'electrode_v6';
geometry_file = 'v6_opt_order=3_run2';

[geometry, boundaries] = mp_geo_load ([geometry_file '.txt']);

% write .iges files
% write_iges (['v6_opt'], geometry);

% write .dat files
% write_ctrl_opt (geometry);
% write_boundary (geometry);
% write_geometry (geometry);

% plot geometry
plot_geometry (geometry, boundaries);

% solve electrostatic problem
[problem_data, method_data] = setup_problem (geometry_file);
tic;
[geometry, msh, space, phi] = mp_solve_electrostatics (problem_data, method_data);
fprintf('\ntime elapsed for solution: %d min\n', toc/60);

% plot absolute value of electric field and write .dat files
% npts = 8;
% vtk_pts = {linspace(0, 1, npts), linspace(0, 1, npts)};
% plot_es_mp (phi, space, geometry, vtk_pts, ['E_degree=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub(1)) '_npts=' num2str(npts)]);
% view(2);

% write .vtk files
sp_to_vtk (phi, space, geometry, method_data.nsub, ['E_degree=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub(1))], 'E', 'gradient');
