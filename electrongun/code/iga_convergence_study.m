N_it = 5;
geometry_file = 'gun_half_short';

errh1 = NaN(1,N_it+1);
errl2 = NaN(1,N_it+1);
voltage = 90e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);

% reference solution
method_data.degree = [3 3];
method_data.nsub = [2^N_it 2^N_it];
tic;
[geometry, msh_ref, space_ref, u_ref] = mp_solve_laplace (problem_data, method_data);
fprintf('time elapsed for reference solution:%d\n', toc);

% convergence study
method_data.degree = [2 2];
for iit=0:N_it
  fprintf('\niteration with nsub = %d\n', 2^iit);
  method_data.nsub = [2^iit 2^iit];
  tic;
  [geometry, msh_conv, space_conv, u_conv] = mp_solve_laplace (problem_data, method_data);
  fprintf('time elapsed for field solution:%d\n', toc);
  tic;
  % maybe change this from absoute error to relative error in the implementation
  [errh1(iit+1), errl2(iit+1)] = mp_sp_h1_error_ref (space_ref, msh_ref, u_ref, u_conv, space_conv, geometry);
  fprintf('time elapsed for error computation:%d\n', toc);
end

save([geometry_file '_degree=2_nsub=var.mat'], 'N_it', 'errh1', 'errl2');

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
