function [E, x, y, z] = compute_fieldmap (geometry_file, voltage, Nx, Ny, Nz)
  [problem_data, method_data] = init_potential (geometry_file, voltage);
  [geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);

  % determine evaluation points for the fieldmap
  cathode_top = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,1}, 0, geometry(1).rdim);
  cathode_start = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,0}, 0, geometry(1).rdim);
  beamtube_end = geo_nurbs (geometry(8).nurbs, geometry(8).dnurbs, geometry(8).dnurbs2, {1,0}, 0, geometry(8).rdim);
  x = linspace(-cathode_top(2), cathode_top(2), Nx);
  y = linspace(-cathode_top(2), cathode_top(2), Ny);
  z = linspace(cathode_start(1), beamtube_end(1), Nz);

  % transform to parametric coordinates and compute E-field in one step
  [ptcs] = set_ptcs (geometry_file);
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
