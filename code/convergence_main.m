pkg load geopdes;

geometry_file = 'photocathode_200kV_v5';
filename      = 'cvg_v5';
% specify problem and material data
voltage = -200e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);
degree_ref = [3 3];
nsub_ref   = [8 8];
degree     = [2 2];
N_it       = 4;

% compute errors
compute_errh1 (problem_data, method_data, degree_ref, nsub_ref, degree, N_it, filename);
% plot errors
plot_convergence (degree_ref, nsub_ref, degree, N_it, filename);

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
