% evaluate h1

function [errh1, errl2, errh1s, errh1_elem, errl2_elem, errh1s_elem] = sp_h1_error_eval_h1_ref (sp, msh, u_ref, space_ref, u_conv, space_conv, geometry)
% this is used for ensuring that the original version and the modified one coincide
grad_valu_test = sp_eval_msh (u_ref, sp, msh, 'gradient');

% get quadrature points
msh_pts_x = msh.qn{1};
msh_pts_y = msh.qn{2};
msh_pts_y = reshape( msh_pts_y, 1, numel(msh_pts_y) );

% evaluate solution
grad_valu_ref = sp_eval(u_ref, space_ref, geometry, {msh_pts_x, msh_pts_y}, 'gradient');
grad_valu_conv = sp_eval(u_conv, space_conv, geometry, {msh_pts_x, msh_pts_y}, 'gradient');

% reshape the solution in two steps to exactly match the original
grad_valu_ref = reshape(grad_valu_ref, msh.rdim, msh.nqn, msh.nel);
grad_valu_conv = reshape(grad_valu_conv, msh.rdim, msh.nqn, msh.nel);

grad_valu_test = reshape (grad_valu_test, sp.ncomp, msh.rdim, msh.nqn, msh.nel);
grad_valu_ref = reshape (grad_valu_ref, sp.ncomp, msh.rdim, msh.nqn, msh.nel);
grad_valu_conv = reshape (grad_valu_conv, sp.ncomp, msh.rdim, msh.nqn, msh.nel);

% tests if the original and new solution coincide
%keyboard;
if ( max(max(max(grad_valu_ref - grad_valu_test)))~=0 )
	error('original and new solution differ');
end

% compute determinant and quadrature weights
w = msh.quad_weights .* msh.jacdet;
% evaluate l2
[errl2, errl2_elem] = sp_l2_error_eval_l2_ref (sp, msh, u_ref, space_ref, u_conv, space_conv, geometry);

% relative error seems to return worse results
% errh1s_elem = sum (reshape (sum (sum (((grad_valu_conv - grad_valu_ref)./grad_valu_ref).^2, 1), 2), [msh.nqn, msh.nel]) .* w);
errh1s_elem = sum (reshape (sum (sum ((grad_valu_conv - grad_valu_ref).^2, 1), 2), [msh.nqn, msh.nel]) .* w);
errh1s = sqrt (sum (errh1s_elem));

errh1  = sqrt (errl2^2 + errh1s^2);

errh1_elem  = sqrt (errl2_elem.^2 + errh1s_elem);
errh1s_elem = sqrt (errh1s_elem);
end
