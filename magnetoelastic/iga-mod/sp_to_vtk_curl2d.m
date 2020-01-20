% INPUT:
%
%     u:           vector of dof weights
%     space:       object representing the space of discrete functions (see sp_scalar)
%     geometry:    geometry structure (see geo_load)
%     npts:        number of points along each parametric direction where to evaluate
%     pts:         cell array with the coordinates along each parametric direction of the points where to evaluate
%     filename:    name of the output file.
%     fieldnames:  how to name the saved variables in the vtk file
%     options:     cell array with the fields to plot
%                   accepted options are 'value' (default), 'gradient',
%                   and for vectors also 'curl', 'divergence', 'stress'
%     lambda_lame: function handle to the first Lame coefficient (only needed to compute 'stress')
%     mu_lame:     function handle for the second Lame coefficient (only needed to compute 'stress')
%
% OUTPUT:
%
%    none

function sp_to_vtk (u, space, geometry, npts, filename, fieldname, varargin)

  % eu = [u_x1; u_x2]
  [eu, F] = sp_eval (u, space, geometry, npts, varargin{:});
  % curl of u, if only a z-component is present
  b = [eu(2,:,:); -eu(1,:,:)];

  msh_to_vtk (F, b, filename, fieldname);

end
