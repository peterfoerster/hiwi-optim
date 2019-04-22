function [cathode_start, y, z] = create_fieldmap (filename, geometry, boundaries, interfaces, boundary_interfaces, ptcs, voltage)
  % choose physical coordinates with z as longitudinal axis
  % y is radial component for 2D
  cathode_top = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,1}, 0, geometry(1).rdim);
  cathode_start = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,0}, 0, geometry(1).rdim);
  beamtube_end = geo_nurbs (geometry(8).nurbs, geometry(8).dnurbs, geometry(8).dnurbs2, {1,1}, 0, geometry(8).rdim);
  % maybe even smaller range for smaller field amplitudes?
  x = [-1e-2 0 1e-2];
  y = linspace(-cathode_top(2), cathode_top(2), 15);
  % it seems like the off axis particle cannot be tracked correctly with this?
  % z = [linspace(cathode_start(1), 0.1, 16), linspace(0.11, 0.2, 8) linspace(0.3, beamtube_end(1), 26)];
  z = linspace(cathode_start(1), beamtube_end(1), 30);

  [problem_data, method_data] = init_potential (voltage);
  [geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);

  [E, Nx, Ny, Nz] = compute_fieldmap (geometry, ptcs, space, u, x, y, z);

  % E-field is in MV/m in Astra
  write_fieldmap (filename, Nx, x, Ny, y, Nz, z, 1e-6*E);
end
