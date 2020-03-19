% INPUT:
%
%     u:           vector of dof weights
%     space:       object defining the discrete space (see sp_multipatch)
%     geometry:    an array of geometry structures (see mp_geo_load)
%     pts:         cell array with coordinates of points along each parametric direction
%     npts:        number of points along each parametric direction
%     ncuts:       only for volumetric domains, number of internal "cuts" in each parametric direction.
%                    The zero value will plot the solution on the boundary.

function plot_gradient_mp (u, space, geometry, npts, filename)

if (nargin < 4)
  npts = [];
end

if (isa (space.sp_patch{1}, 'sp_vector'))
  disp ('Warning: a different scaling is used for each patch')
end

hold_flag = ishold ;
for iptc = 1:space.npatch
   % only for sp_vector
  if (isempty (space.dofs_ornt))
    plot_gradient_dat (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), npts, filename, iptc);
  else
    sp_plot_solution (u(space.gnum{iptc}) .* space.dofs_ornt{iptc}.', space.sp_patch{iptc}, geometry(iptc), npts, ncuts);
  end
  hold on
end

if (~hold_flag)
  hold off
end

end
