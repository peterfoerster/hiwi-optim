% multipatch

function [h1_conv, h1_ref, l2_conv, l2_ref] = mp_sp_h1_ref (space_ref, msh_ref, u_ref, u_conv, space_conv, geometry)
if (space_ref.npatch ~= msh_ref.npatch)
  error ('The number of patches does not coincide')
end

for iptc = 1:msh_ref.npatch
  % added part for reference solution
  if (isempty (space_ref.dofs_ornt))
    u_ptc_ref = u_ref(space_ref.gnum{iptc});
  else
    u_ptc_ref = u_ref(space_ref.gnum{iptc}) .* space_ref.dofs_ornt{iptc}.';
  end%if
  if (isempty (space_conv.dofs_ornt))
    u_ptc_conv = u_conv(space_conv.gnum{iptc});
  else
    u_ptc_conv = u_conv(space_conv.gnum{iptc}) .* space_conv.dofs_ornt{iptc}.';
  end
  % single patch
  [h1_conv(iptc), h1_ref(iptc), l2_conv(iptc), l2_ref(iptc)] = sp_h1_ref (msh_ref.msh_patch{iptc}, space_ref.sp_patch{iptc}, u_ptc_ref, u_ptc_conv, space_conv.sp_patch{iptc}, geometry(iptc));
end
l2_conv = sqrt (sum (l2_conv .* l2_conv));
l2_ref = sqrt (sum (l2_ref .* l2_ref));
h1_conv = sqrt (sum (h1_conv .* h1_conv));
h1_ref = sqrt (sum (h1_ref .* h1_ref));
end
