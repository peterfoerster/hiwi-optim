function [E_avg] = computeE_avg (u, msh, space, geometry)
E_avg = 0;
N_el  = msh.nel_dir(1);
  for iel = 1:N_el
    msh_col = msh_evaluate_col (msh, iel);

    E_col = sp_eval(u, space, geometry, msh_col.qn, 'gradient');
    E_col = sqrt(E_col(1,:,:).^2 + E_col(2,:,:).^2);

    N_qn = size(msh_col.qn{1},1)*size(msh_col.qn{1},2)*size(msh_col.qn{2},1)*size(msh_col.qn{2},2);
    E_avg_col = 1/N_qn * sum(sum(E_col));
    E_avg     = E_avg + E_avg_col;
  end
  E_avg = E_avg/N_el;
end
