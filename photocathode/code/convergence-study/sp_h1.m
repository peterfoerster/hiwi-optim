% single patch

function [h1, l2] = sp_h1 (msh_ref, space_ref, u, space_def, geometry)
l2 = 0; h1s = 0;
% evaluate individual elements to plot error on single elements?
for iel = 1:msh_ref.nel_dir(1)
  msh_col = msh_evaluate_col (msh_ref, iel);
  sp_col = sp_evaluate_col (space_ref, msh_col, 'value', true, 'gradient', true);
  % evaluate h1
  [l2_el, h1s_el] = sp_h1_el (sp_col, msh_col, space_ref, u, space_def, geometry);

  h1s = h1s + h1s_el.^2;
  l2 = l2 + l2_el.^2;
end

h1 = sqrt (l2 + h1s);
l2 = sqrt (l2);
end
