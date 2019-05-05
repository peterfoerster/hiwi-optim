% evaluate l2

function [l2] = sp_l2_el (sp, msh, space_ref, u, space_def, geometry)
% get quadrature points
msh_pts_x = msh.qn{1};
msh_pts_y = msh.qn{2};
msh_pts_y = reshape( msh_pts_y, 1, numel(msh_pts_y) );

valu = sp_eval(u, space_def, geometry, {msh_pts_x, msh_pts_y}, 'value');

% reshape according to original
valu = reshape (valu, sp.ncomp, msh.nqn, msh.nel);

% compute determinant and quadrature weights
w = msh.quad_weights .* msh.jacdet;

l2_elem = sum (reshape (sum (valu.^2, 1), [msh.nqn, msh.nel]) .* w);
l2  = sqrt (sum (l2_elem));
end
