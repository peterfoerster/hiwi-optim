function [] = plot_potential (res_x, res_y, u, space, geometry)
vtk_pts = {linspace(0, 1, res_x), linspace(0, 1, res_y)};
sp_plot_solution_grad (u, space, geometry, vtk_pts);
view(2);
shading interp;
colormap('jet');
colorbar('SouthOutside');
grid off;
end
