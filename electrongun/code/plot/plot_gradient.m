function [] = plot_gradient (nsub_x, nsub_y, u, space, geometry)
  % possible to manually control the resolution (increase accuracy in given area)
  vtk_pts = {linspace(0, 1, nsub_x), linspace(0, 1, nsub_y)};
  sp_plot_solution_grad (u, space, geometry, vtk_pts);
  view(2);
  shading interp;
  colormap('jet');
  colorbar('SouthOutside');
  grid off;
end
