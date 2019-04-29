function [cathode_start, x, y, z] = create_fieldmap_3D (filename, geometry, boundaries, interfaces, boundary_interfaces, ptcs, voltage)
  % determine boundaries of domain
  cathode_top = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,1}, 0, geometry(1).rdim);
  cathode_start = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,0}, 0, geometry(1).rdim);
  beamtube_end = geo_nurbs (geometry(8).nurbs, geometry(8).dnurbs, geometry(8).dnurbs2, {1,1}, 0, geometry(8).rdim);
  % transversal components
  x = -cathode_top(2):dx:cathode_top(2);
  y = -cathode_top(2):dy:cathode_top(2);
  % longitudinal components
  z = cathode_start(1):dz:beamtube_end(1);

  [problem_data, method_data] = init_potential (voltage);
  [geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);

  [E_quad, Nx, Ny, Nz] = compute_fieldmap_3D (geometry, ptcs, space, u, x, y, z);

  % mirror field for 2^nd 3^rd 4^th quadrant, not trivial
  % x = [-x(2:end) x];
  % y = [-y(2:end) y];
  % E = zeros(2*Nx-1, 2*Ny-1, Nz, 3);

  % E-field is in MV/m in Astra
  write_fieldmap (filename, Nx, x, Ny, y, Nz, z, 1e-6*E);
end
