function [V] = computeV_cyl_mp (msh)
   V = 0;
   for iptc=1:msh.npatch
      V = V + computeV_cyl_ptc(msh.msh_patch{iptc});
   end
end
