function [] = plot_potential (nsub_x, nsub_y, u, space, geometry)
vtk_pts = {linspace(0, 1, nsub_x), linspace(0, 1, nsub_y)};
sp_plot_solution (u, space, geometry, vtk_pts);
view(2);
shading faceted;
colormap('jet');
colorbar('SouthOutside');
grid off;
end
