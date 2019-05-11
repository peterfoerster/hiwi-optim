pkg load geopdes;
degree_ref = 5;
degree = 2;
N_it = 4;
geometry_file = 'photocathode_insulator';

voltage = -60e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);

% reference solution
method_data.degree = [degree_ref degree_ref];
method_data.regularity = [degree_ref-1 degree_ref-1];
method_data.nsub = [2^N_it 2^N_it];
method_data.nquad = [degree_ref+1 degree_ref+1];
tic;
[geometry, msh_ref, space_ref, u] = mp_solve_laplace_mod (problem_data, method_data);
fprintf('time elapsed for reference solution:%d\n', toc);

% convergence study
method_data.degree = [degree degree];
method_data.regularity = [degree-1 degree-1];
method_data.nquad = [degree_ref+1 degree_ref+1];
for iit=0:0
  fprintf('\niteration with nsub = %d\n', 2^iit);
  method_data.nsub = [2^iit 2^iit];
  tic;
  [geometry, msh_conv, space_conv, u_conv] = mp_solve_laplace_mod (problem_data, method_data);
  fprintf('time elapsed for field solution:%d\n', toc);
  tic;
  mp_sp_h1_error_ref (space_ref, msh_ref, u_ref, u_conv, space_conv, geometry);
  fprintf('time elapsed for norm computation:%d\n', toc);
end

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
