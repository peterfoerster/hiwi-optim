% single patch

function [errh1, errl2, errh1s] = sp_h1_error_ref (msh_ref, space_ref, u_ref, u_conv, space_conv, geometry)
errl2 = 0; errh1s = 0;
for iel = 1:msh_ref.nel_dir(1)
  msh_col = msh_evaluate_col (msh_ref, iel);
  sp_col = sp_evaluate_col (space_ref, msh_col, 'value', true, 'gradient', true);
  % evaluate h1
  [~, err_l2, err_h1s] = sp_h1_error_eval_h1_ref (sp_col, msh_col, u_ref, space_ref, u_conv, space_conv, geometry);

  errh1s = errh1s + err_h1s.^2;
  errl2 = errl2 + err_l2.^2;
end

errh1 = sqrt (errl2 + errh1s);
errl2 = sqrt (errl2);
errh1s = sqrt (errh1s);
end
