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
          % need to compute appropriate field components using the angle
          E_2D = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_par(1), r_par(2)}, 'gradient');
          E(ix,iy,iz,:) = [E_2D(2)*cos(phi) E_2D(2)*sin(phi) E_2D(1)];
        end%if
      end
    end
  end%for
end
