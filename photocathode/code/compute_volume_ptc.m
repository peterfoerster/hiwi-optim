function [V] = compute_volume_ptc (msh, space)
V = 0;
  for iel = 1:msh.nel_dir(1)
    msh_col = msh_evaluate_col (msh, iel);
    w = msh_col.quad_weights .* msh_col.jacdet;
    r = squeeze(msh_col.geo_map(2,:,:));

    V_col = 2*pi * sum (r .* w);
    V = V + V_col;
  end
V = sum(V);
end
