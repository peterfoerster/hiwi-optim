function [h] = ctrl_constraint(x, order)
   geometry_file = ['photocathode_200kV_optim_order=' num2str(order)];
   create_photocathode_optim (geometry_file, x, order);
   [geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

   % enforce correct ordering of control points to maintain proper patches
end
