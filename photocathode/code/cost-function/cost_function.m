function [obj] = cost_function (x)
   geometry_file = 'photocathode_200kV_optim';
   N_inc = (length(x)-8)/12;
   [iptcs, ibnds] = move_geo_ctrl (geometry_file, N_inc, x);
   [geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

   voltage = -200e3;
   [problem_data, method_data] = init_potential (geometry_file, voltage);
   [geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data);

   [obj] = computeE_avg (u(space.gnum{12}), msh.msh_patch{12}, space.sp_patch{12}, geometry(12));
end
