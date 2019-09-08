function [A] = computeS_ptc (msh)
A = 0;
  for iel = 1:msh.nel_dir(1)
    msh_col = msh_evaluate_col (msh, iel);
    w       = msh_col.quad_weights .* msh_col.jacdet;

    A_col = sum (w);
    A     = A + A_col;
  end
A = sum(A);
end
