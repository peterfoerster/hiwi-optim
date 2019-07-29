function [A] = compute_surface_mp (space, msh)
A = 0;
for iptc=1:msh.npatch
  A = A + compute_surface_ptc(msh.msh_patch{iptc}, space.sp_patch{iptc});
end
