% INPUT:
%       - geometry
%       - space
%       - phi
%       - x
%       - y
%       - z
% OUTPUT:
%       - E
%       - Nx
%       - Ny
%       - Nz

function [E, Nx, Ny, Nz] = compute_fieldmap (geometry, space, phi, x, y, z)
    Nx = length(x);
    Ny = length(y);
    Nz = length(z);
    % center given by (Nx,Ny,iz)
    E = zeros(2*Nx-1, 2*Ny-1, Nz, 3);

    for iz=1:Nz
        if (mod(iz,16) == 0)
            fprintf('\ncompute_fieldmap: nz=%i\n', iz);
        end
        for iy=1:Ny
            for ix=1:Nx
                % transform cartesian to polar coordinates
                [theta, rho]  = cart2pol(x(ix), y(iy));
                % transform to cartesian (parametric) coordinates
                [x_par, iptc] = phy2par([z(iz) rho 0], geometry);
                E_2d = -sp_eval (phi(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {x_par(1), x_par(2)}, ...
                                 'gradient');
                % 1^st quadrant
                E(Nx-1+ix,Ny-1+iy,iz,:) = [E_2d(2)*cos(theta) E_2d(2)*sin(theta) E_2d(1)];
                % 2^nd quadrant
                E(Nx+1-ix,Ny-1+iy,iz,:) = [-E_2d(2)*cos(theta) E_2d(2)*sin(theta) E_2d(1)];
                % 3^rd quadrant
                E(Nx+1-ix,Ny+1-iy,iz,:) = [-E_2d(2)*cos(theta) -E_2d(2)*sin(theta) E_2d(1)];
                % 4^th quadrant
                E(Nx-1+ix,Ny+1-iy,iz,:) = [E_2d(2)*cos(theta) -E_2d(2)*sin(theta) E_2d(1)];
                if (x(ix) == 0)
                    % manually set on axis x-component to zero
                    E(Nx-1+ix,Ny-1+iy,iz,1) = 0;
                    E(Nx+1-ix,Ny-1+iy,iz,1) = 0;
                    E(Nx+1-ix,Ny+1-iy,iz,1) = 0;
                    E(Nx-1+ix,Ny-1+iy,iz,1) = 0;
                end
                if (y(iy) == 0)
                    % manually set on axis y-component to zero
                    E(Nx-1+ix,Ny-1+iy,iz,2) = 0;
                    E(Nx+1-ix,Ny-1+iy,iz,2) = 0;
                    E(Nx+1-ix,Ny+1-iy,iz,2) = 0;
                    E(Nx-1+ix,Ny-1+iy,iz,2) = 0;
                end%if
            end
        end
    end%for
end
