N_it = 5;
geometry_file = 'gun_half_short';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

E_r = NaN(4,N_it+1);
voltage = 90e3;
[problem_data, method_data] = init_potential (voltage);

% convergence study
method_data.degree = [2 2];
for iit=0:N_it
  fprintf('\niteration with nsub = %d\n', 2^iit);
  method_data.nsub = [2^iit 2^iit];
  tic;
  [geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);
  fprintf('time elapsed for field solution:%d\n', toc);

  E_r(1,iit) = -sp_eval (u(space.gnum{1}), space.sp_patch{1}, geometry(1), {0.5, 0}, 'gradient');
  E_r(1,iit) = -sp_eval (u(space.gnum{4}), space.sp_patch{4}, geometry(4), {0.5, 0}, 'gradient');
  E_r(1,iit) = -sp_eval (u(space.gnum{6}), space.sp_patch{6}, geometry(6), {0.5, 0}, 'gradient');
  E_r(1,iit) = -sp_eval (u(space.gnum{8}), space.sp_patch{8}, geometry(8), {0.5, 0}, 'gradient');
end

save(['onaxis_' geometry_file '_degree=2_nsub=var.mat'], 'N_it', 'errh1', 'errl2');

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);
