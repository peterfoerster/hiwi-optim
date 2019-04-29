function [E, Nx, Ny, Nz] = compute_fieldmap_3D (geometry, ptcs, space, u, x, y, z)
  % transform to parametric coordinates and compute E-field in one step
  Nx = length(x);
  Ny = length(y);
  Nz = length(z);
  E = zeros(2*Nx-1, 2*Ny-1, Nz, 3);

  % extra treatment of center values and ix=0 and iy=0
  for iz=1:Nz
    % transform cartesian to polar coordinates
    [phi, rho] = cart2pol (x(1), y(1));
    [out, r_par, iptc] = tfr_phys_to_param (geometry, ptcs, [z(iz) rho 0]);
      if (~out)
        % return to cartesian coordinates
        E_2D = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_par(1), r_par(2)}, 'gradient');
        % 1^st quadrant
        E(1,1,iz,:) = [E_2D(2)*cos(phi) E_2D(2)*sin(phi) E_2D(1)];
        if (x(1) == 0)
          % manually set on axis x-component to zero
          E(1,1,iz,1) = 0;
        end
        if (y(1) == 0)
          % manually set on axis y-component to zero
          E(1,1,iz,2) = 0;
        end
      end%if
  end%for
keyboard
  for iz=1:Nz
    for iy=2:Ny
      for ix=2:Nx
        % transform cartesian to polar coordinates
        [phi, rho] = cart2pol (x(ix), y(iy));
        [out, r_par, iptc] = tfr_phys_to_param (geometry, ptcs, [z(iz) rho 0]);
        if (~out)
          % return to cartesian coordinates
          E_2D = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_par(1), r_par(2)}, 'gradient');
          % 1^st quadrant
          E(Nx-1+ix,Ny-1+iy,iz,:) = [E_2D(2)*cos(phi) E_2D(2)*sin(phi) E_2D(1)];
          % 2^nd quadrant
          E(Nx+1-ix,Ny-1+iy,iz,:) = [-E_2D(2)*cos(phi) E_2D(2)*sin(phi) E_2D(1)];
          % 3^rd quadrant
          E(Nx+1-ix,Ny+1-iy,iz,:) = [-E_2D(2)*cos(phi) -E_2D(2)*sin(phi) E_2D(1)];
          % 4^th quadrant
          E(Nx-1+ix,Ny+1-iy,iz,:) = [E_2D(2)*cos(phi) -E_2D(2)*sin(phi) E_2D(1)];
        end%if
      end
    end
  end%for
end
