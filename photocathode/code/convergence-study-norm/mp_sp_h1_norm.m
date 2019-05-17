% multipatch

function [normh1_ref, normh1, norml2_ref, norml2] = mp_sp_h1_norm (space_ref, msh_ref, u_ref, u, space, geometry, filename)
if (space_ref.npatch ~= msh_ref.npatch)
  error ('The number of patches does not coincide')
end

fid = fopen([filename '/' filename '.pvd'], 'w');
fprintf(fid, '<?xml version="1.0"?>\n<VTKFile type="Collection" version="0.1">\n<Collection>\n');

for iptc = 1:msh_ref.npatch
  % added part for reference solution
  if (isempty (space_ref.dofs_ornt))
    u_ptc_ref = u_ref(space_ref.gnum{iptc});
  else
    u_ptc_ref = u_ref(space_ref.gnum{iptc}) .* space_ref.dofs_ornt{iptc}.';
  end%if
  if (isempty (space.dofs_ornt))
    u_ptc = u(space.gnum{iptc});
  else
    u_ptc = u(space.gnum{iptc}) .* space.dofs_ornt{iptc}.';
  end

  fprintf(fid, '<DataSet part="%d" file="%s_%d.vts"/>\n', iptc, filename, iptc);
  % single patch
  [normh1_ref, normh1, norml2_ref, norml2] = sp_h1_norm (msh_ref.msh_patch{iptc}, space_ref.sp_patch{iptc}, u_ptc_ref, u_ptc, space.sp_patch{iptc}, geometry(iptc), iptc, filename);
end

fprintf(fid, '</Collection>\n</VTKFile>');
fclose(fid);

normh1_ref = sqrt (sum (normh1_ref .* normh1_ref));
normh1 = sqrt (sum (normh1 .* normh1));

norml2_ref = sqrt (sum (norml2_ref.* norml2_ref));
norml2 = sqrt (sum (norml2 .* norml2));
end
