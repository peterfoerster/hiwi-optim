% Run a convergence study for the electrostatic field solution.

geometry_file = 'geometry_v6_orig';
filename      = 'cvg_v6';
% specify problem and material data
[problem_data, method_data] = setup_problem (geometry_file);
N_it       = 4;
degree_ref = [3 3];
nsub_ref   = [2^N_it 2^N_it];
degree     = [2 2];

% compute error
compute_errh1 (problem_data, method_data, degree_ref, nsub_ref, degree, N_it, filename);
% plot error
plot_convergence (degree_ref, nsub_ref, degree, N_it, filename);

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
