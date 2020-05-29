function [fc] = ctrl_constraint(x, order, N_ctrl)
   geometry_file = ['v6_opt_order=' num2str(order)];
   create_geometry_opt (geometry_file, x, order);
   geometry = mp_geo_load ([geometry_file '.txt']);

   ctrl_diff_lb = ctrl_diff_ub = NaN(2*N_ctrl,1);
   [ctrl_diff_lb, ctrl_diff_ub] = compute_ctrl_constraint(geometry, ctrl_diff_lb, ctrl_diff_ub, order);
   % plot_bounds (-ctrl_diff_lb, ctrl_diff_ub, geometry_file, order);

   ctrl_diff = [ctrl_diff_lb; ctrl_diff_ub];
   ix = ~isnan(ctrl_diff);
   % fc <= 0
   fc = -min(ctrl_diff(ix));
   fprintf('\nctrl_constraint: fc=%d\n', fc);
end
