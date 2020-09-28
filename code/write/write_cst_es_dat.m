% INPUT:
%       - x:
%       - y:
%       - E:
%       - phi: vector of dof weights
%       - space: object defining the discrete space (sp_scalar)
%       - geometry: geometry structure (geo_load)
%       - vtk_pts: cell array with coordinates of points along each parametric direction
%       - filename
%       - iptc

function write_cst_es_dat (x, y, E, phi, space, geometry, vtk_pts, filename, iptc)
    [~, F] = sp_eval (phi, space, geometry, vtk_pts, 'gradient');

    ndim = numel (space.knots);
    rdim = size (F, 1);
    if (ndim == 2)
        if (rdim == 2)
            [X, Y] = deal(squeeze(F(1,:,:)), squeeze(F(2,:,:)));
            E = griddata(x, y, E, X, Y);
            E(isnan(E)) = 0;
            surf(X, Y, E);
            write_dat3D([filename '_' num2str(iptc) '.dat'], X, Y, E);
        elseif (rdim == 3)
            [X, Y, Z] = deal(squeeze(F(1,:,:)), squeeze(F(2,:,:)), squeeze(F(3,:,:)));
            surf(X, Y, Z, E);
        end
    end
end
