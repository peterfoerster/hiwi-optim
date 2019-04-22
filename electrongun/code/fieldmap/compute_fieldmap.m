function [E, Nx, Ny, Nz] = compute_fieldmap (geometry, ptcs, space, u, x, y, z)
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
          if (x(ix) == 0)
            % manually set x-component of radial field to zero
            E(ix,iy,iz,:) = [0 E_2D(2)*sin(phi) E_2D(1)];
          else
            E(ix,iy,iz,:) = [E_2D(2)*cos(phi) E_2D(2)*sin(phi) E_2D(1)];
          end
          % test
          if (x(ix) == 0 && E(ix,iy,iz,1) > 1e-10)
            error('field value unexpectedly unequal to zero');
          end
        end%if
      end
    end
  end%for
end
