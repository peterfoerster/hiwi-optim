% single patch

function [h1_conv, h1_ref, l2_conv, l2_ref] = sp_h1_ref (msh_ref, space_ref, u_ref, u_conv, space_conv, geometry)
l2_conv = 0; l2_ref = 0; h1s_conv = 0; h1s_ref = 0;
% evaluate individual elements to plot error on single elements?
for iel = 1:msh_ref.nel_dir(1)
  msh_col = msh_evaluate_col (msh_ref, iel);
  sp_col = sp_evaluate_col (space_ref, msh_col, 'value', true, 'gradient', true);
  % evaluate h1
  [l2conv, l2ref, h1sconv, h1sref] = sp_h1_eval_h1_ref (sp_col, msh_col, u_ref, space_ref, u_conv, space_conv, geometry);

  h1s_conv = h1s_conv + h1sconv.^2;
  h1s_ref = h1s_ref + h1sref.^2;
  l2_conv = l2_conv + l2conv.^2;
  l2_ref = l2_ref + l2ref.^2;
end

h1_conv = sqrt (l2_conv + h1s_conv);
h1_ref = sqrt (l2_ref + h1s_ref);
l2_conv = sqrt (l2_conv);
l2_ref = sqrt (l2_ref);
end
