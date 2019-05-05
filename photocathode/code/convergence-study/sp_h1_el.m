% evaluate h1

function [l2, h1s] = sp_h1_el (sp, msh, space_ref, u, space_def, geometry)
% get quadrature points
msh_pts_x = msh.qn{1};
msh_pts_y = msh.qn{2};
msh_pts_y = reshape( msh_pts_y, 1, numel(msh_pts_y) );

% evaluate solution
grad_valu = sp_eval(u, space_def, geometry, {msh_pts_x, msh_pts_y}, 'gradient');

% reshape the solution in two steps to exactly match the original
grad_valu = reshape(grad_valu, msh.rdim, msh.nqn, msh.nel);
grad_valu = reshape (grad_valu, sp.ncomp, msh.rdim, msh.nqn, msh.nel);

% compute determinant and quadrature weights
w = msh.quad_weights .* msh.jacdet;
% evaluate l2
[l2] = sp_l2_el (sp, msh, space_ref, u, space_def, geometry);

h1s_elem = sum (reshape (sum (sum (grad_valu.^2, 1), 2), [msh.nqn, msh.nel]) .* w);
h1s = sqrt (sum (h1s_elem));
end
