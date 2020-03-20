% INPUT:
%
%    phi:      vector of dof weights
%    space:    object defining the discrete space (see sp_multipatch)
%    geometry: an array of geometry structures (see mp_geo_load)
%    pts:      cell array with coordinates of points along each parametric direction

function plot_es_mp (phi, space, geometry, pts, filename)
   for iptc = 1:space.npatch
      hold on;
      if (isempty (space.dofs_ornt))
         plot_es_dat (phi(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), pts, filename, iptc);
      end
      hold off;
   end
   axis equal;
end
