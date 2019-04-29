function [E, Nx, Ny, Nz] = compute_fieldmap_3D (geometry, ptcs, space, u, x, y, z)
  % transform to parametric coordinates and compute E-field in one step
  Nx = length(x);
  Ny = length(y);
  Nz = length(z);
  E = zeros(Nx, Ny, Nz, 3);
  for iz=1:Nz
    for iy=1:Ny
      for ix=1:Nx
        % transform cartesian to polar coordinates
        [phi, rho] = cart2pol (x(ix), y(iy));
        [out, r_par, iptc] = tfr_phys_to_param (geometry, ptcs, [z(iz) rho 0]);
        if (~out)
          % return to cartesian coordinates
          E_2D = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_par(1), r_par(2)}, 'gradient');
          E(ix,iy,iz,:) = [E_2D(2)*cos(phi) E_2D(2)*sin(phi) E_2D(1)];
          if (x(ix) == 0)
            % manually set on axis x-component to zero
            E(ix,iy,iz,1) = 0;
          end
          if (y(iy) == 0)
            % manually set on axis y-component to zero
            E(ix,iy,iz,2) = 0;
          end
        end%if
      end
    end
  end%for
end
