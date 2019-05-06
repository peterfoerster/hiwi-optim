pkg load geopdes;
degree_ref = 5;
degree = 4;
N_it = 4;
geometry_file = 'photocathode_insulator';

l2_conv = NaN(1,N_it+1);
h1_conv = NaN(1,N_it+1);
voltage = -60e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);

% reference solution
method_data.degree = [degree_ref degree_ref];
method_data.regularity = [degree_ref-1 degree_ref-1];
method_data.nsub = [2^N_it 2^N_it];
method_data.nquad = [degree_ref+1 degree_ref+1];
tic;
[geometry, msh_ref, space_ref, u] = mp_solve_laplace_mod (problem_data, method_data);
[h1_ref, l2_ref] = mp_sp_h1 (space_ref, msh_ref, u, space_ref, geometry);
fprintf('time elapsed for reference solution:%d\n', toc);

% convergence study
method_data.degree = [degree degree];
method_data.regularity = [degree-1 degree-1];
% evaluate with the same number as the reference?
method_data.nquad = [degree_ref+1 degree_ref+1];
for iit=0:N_it
  fprintf('\niteration with nsub = %d\n', 2^iit);
  method_data.nsub = [2^iit 2^iit];
  tic;
  [geometry, msh_def, space_def, u] = mp_solve_laplace_mod (problem_data, method_data);
  fprintf('time elapsed for field solution:%d\n', toc);
  tic;
  [h1_conv(iit+1), l2_conv(iit+1)] = mp_sp_h1 (space_ref, msh_ref, u, space_def, geometry);
  fprintf('time elapsed for norm computation:%d\n', toc);
end

save([geometry_file '_ref=' num2str(degree_ref) '_degree=' num2str(degree) '_N_it=' num2str(N_it) '.mat'], 'N_it', 'h1_conv', 'h1_ref', 'l2_conv', 'l2_ref');

% signal that the program is finished
x = linspace(1, 20, 8000);
Y = sin(2*pi*440*x);
sound(Y);
