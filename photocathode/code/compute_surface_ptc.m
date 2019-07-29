function [A] = compute_surface_ptc (msh, space)
A = 0;
  for iel = 1:msh.nel_dir(1)
    msh_col = msh_evaluate_col (msh, iel);
    sp_col = sp_evaluate_col (space, msh_col, 'value', true, 'gradient', true);

    valu = ones(sp_col.ncomp, msh_col.nqn, msh_col.nel);
    w = msh_col.quad_weights .* msh_col.jacdet;
    A_col = sum (reshape (sum ((valu), 1), [msh_col.nqn, msh_col.nel]) .* w);

    A = A + A_col;
  end
A = sum(A);
end
