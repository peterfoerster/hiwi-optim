function [E] = create_fieldmap (filename, x, y, z, geometry, space, phi)
   tic;
   [E, Nx, Ny, Nz] = compute_fieldmap (geometry, space, phi, x, y, z);
   fprintf('\nfieldmap computation %d min\n', toc/60)

   % axisymmetry
   x = [-flip(x(2:end)) x];
   y = [-flip(y(2:end)) y];
   Nx = 2*Nx-1;
   Ny = 2*Ny-1;

   % E-field in MV/m for Astra
   tic;
   write_fieldmap (filename, Nx, x, Ny, y, Nz, z, E*1e-6);
   fprintf('\nfile creation %d min\n', toc/60);
end
