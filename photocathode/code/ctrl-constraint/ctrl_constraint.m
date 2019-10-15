function [fc] = ctrl_constraint(x, order, N_ctrl)
   geometry_file = ['photocathode_200kV_optim_order=' num2str(order)];
   create_photocathode_optim (geometry_file, x, order);
   [geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

   ctrl_diff_lb = ctrl_diff_ub = NaN(N_ctrl,1);
   [ctrl_diff_lb, ctrl_diff_ub] = compute_ctrl_constraint(geometry, ctrl_diff_lb, ctrl_diff_ub, order);
   % plot_bounds (-ctrl_diff_lb, ctrl_diff_ub, geometry_file, order);

   % fc <= 0
   fc = -min([min(ctrl_diff_lb) min(ctrl_diff_ub)]);
end
