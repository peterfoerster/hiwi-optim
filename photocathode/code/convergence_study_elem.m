pkg load geopdes;
N_it = 4;
geometry_file = 'photocathode_insulator';

voltage = -60e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);

% reference solution
method_data.degree = [5 5];
method_data.nsub = [2^N_it 2^N_it];
tic;
[geometry, msh_ref, space_ref, u_ref] = mp_solve_laplace_mod (problem_data, method_data);
fprintf('time elapsed for reference solution:%d\n', toc);

% convergence study
method_data.degree = [2 2];
for iit=N_it:N_it
  fprintf('\niteration with nsub = %d\n', 2^iit);
  method_data.nsub = [2^iit 2^iit];
  tic;
  [geometry, msh_conv, space_conv, u_conv] = mp_solve_laplace_mod (problem_data, method_data);
  fprintf('time elapsed for field solution:%d\n', toc);
  tic;
  [errh1(iit+1), errl2(iit+1)] = mp_sp_h1_error_ref (space_ref, msh_ref, u_ref, u_conv, space_conv, geometry);
  fprintf('time elapsed for error computation:%d\n', toc);
end

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
