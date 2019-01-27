function [] = plot_potential_2D (res_x, res_y, u, space, geometry)
vtk_pts = {linspace(0, 1, res_x), linspace(0, 1, res_y)};
% original variant from geopdes
%sp_plot_solution (u, space, geometry, [20 20 20], [2 2 2]);
sp_plot_solution (u, space, geometry, vtk_pts);
view(2);
shading faceted;
colormap('jet');
colorbar('SouthOutside');
grid off;
end
