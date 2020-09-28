% INPUT:
%       - x:
%       - y:
%       - E:
%       - phi: vector of dof weights
%       - space: object defining the discrete space (sp_multipatch)
%       - geometry: array of geometry structures (mp_geo_load)
%       - pts: cell array with coordinates of points along each parametric direction
%       - filename

function write_cst_es_mp (x, y, E, phi, space, geometry, pts, filename)
    for iptc=1:space.npatch
        hold on;
        if (isempty(space.dofs_ornt))
            write_cst_es_dat (x, y, E, phi(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), pts, filename, iptc);
        end
        hold off;
    end
end
