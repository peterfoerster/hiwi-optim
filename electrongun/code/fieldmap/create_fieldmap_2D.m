function [geometry] = create_fieldmap_2D (geometry_file, voltage, Ny, Nz)
  tic;
  [E, x, y, z, Nx, geometry] = compute_fieldmap_2D (geometry_file, voltage, Ny, Nz);
  fprintf('\ntime elapsed for field evaluation:%d\n', toc);

  % E-field is in MV/m in Astra
  write_fieldmap (Nx, x, Ny, y, Nz, z, 1e-6*E);
end
