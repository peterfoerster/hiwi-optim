% single patch

function [errh1, errl2, errh1s] = sp_h1_error_ref (msh_ref, space_ref, u_ref, u_conv, space_conv, geometry, iptc)
errl2 = 0; errh1s = 0; c = [];

% compute points for plotting of error
for idim=1:2
  vtk_pts{idim} = linspace (space_ref.knots{idim}(1), space_ref.knots{idim}(end), msh_ref.nel_dir(idim));
end
[~, F] = sp_eval (u_ref, space_ref, geometry, vtk_pts);
[X, Y]  = deal (squeeze(F(1,:,:)), squeeze(F(2,:,:)));

for iel = 1:msh_ref.nel_dir(1)
  msh_col = msh_evaluate_col (msh_ref, iel);
  sp_col = sp_evaluate_col (space_ref, msh_col, 'value', true, 'gradient', true);
  % evaluate h1
  [~, err_l2, err_h1s, errh1_elem] = sp_h1_error_eval_h1_ref (sp_col, msh_col, u_ref, space_ref, u_conv, space_conv, geometry);

  % should contain errors in correct order
  c = [c; errh1_elem];
  % errh1_elem contains x and y_low ... y_high

  errh1s = errh1s + err_h1s.^2;
  errl2 = errl2 + err_l2.^2;
end

% write to .dat file
fprintf(['creating error_elem_' num2str(iptc) '.dat\n']);
fid = fopen(['error_elem_' num2str(iptc) '.dat'], 'w');
fprintf(fid, 'x y c\n');
for icol=1:size(X,2)
  % c should contain similar x values in same row, contrary to X and Y
dlmwrite(fid, [X(:,icol) Y(:,icol) c(icol,:)'], 'delimiter', '  ', 'append', 'on');
fprintf(fid, '\n');
end
fclose(fid);

errh1 = sqrt (errl2 + errh1s);
errl2 = sqrt (errl2);
errh1s = sqrt (errh1s);
end
