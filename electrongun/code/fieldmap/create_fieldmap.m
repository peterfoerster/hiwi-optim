function [] = create_fieldmap (geometry_file, voltage, Nx, Ny, Nz)
  tic;
  [E, x, y, z] = compute_fieldmap (geometry_file, voltage, Nx, Ny, Nz);
  fprintf('\ntime elapsed for field evaluation:%d\n', toc);

  % E-field is in MV/m in Astra
  write_fieldmap (Nx, x, Ny, y, Nz, z, 1e-6*E);
end
