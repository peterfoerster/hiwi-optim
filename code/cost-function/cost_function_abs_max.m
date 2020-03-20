function [obj] = cost_function_abs_max (x, order)
   geometry_file = ['photocathode_200kV_optim_order=' num2str(order)];
   create_photocathode_optim (geometry_file, x, order);
   [geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

   [problem_data, method_data] = setup_problem (geometry_file);
   [geometry, msh, space, phi] = mp_solve_electrostatics (problem_data, method_data);

   iptcs = [5 6 7 8 9];
   obj = 0;
   for ii=1:length(iptcs)
      obj_ptc = computeE_max (phi(space.gnum{iptcs(ii)}), msh.msh_patch{iptcs(ii)}, space.sp_patch{iptcs(ii)}, geometry(iptcs(ii)));
      obj = max([obj obj_ptc]);
   end
end
