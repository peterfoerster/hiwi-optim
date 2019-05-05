% multipatch

function [h1, l2] = mp_sp_h1 (space_ref, msh_ref, u, space_def, geometry)
if (space_ref.npatch ~= msh_ref.npatch)
  error ('The number of patches does not coincide')
end

for iptc = 1:msh_ref.npatch
  if (isempty (space_def.dofs_ornt))
    u_ptc = u(space_def.gnum{iptc});
  else
    u_ptc = u(space_def.gnum{iptc}) .* space_def.dofs_ornt{iptc}.';
  end
  % single patch
  [h1(iptc), l2(iptc)] = sp_h1 (msh_ref.msh_patch{iptc}, space_ref.sp_patch{iptc}, u_ptc, space_def.sp_patch{iptc}, geometry(iptc));
end
l2 = sqrt (sum (l2 .* l2));
h1 = sqrt (sum (h1 .* h1));
end
