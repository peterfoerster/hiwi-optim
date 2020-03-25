function [cathode_start, x, y, z, E] = create_fieldmap (filename, dx, dy, dz, geometry, space, phi)
   rho   = nrbeval(geometry(6).nurbs, [0 1]);
   z_max = nrbeval(geometry(1).nurbs, [1 0]);
   % transversal dimensions
   x = 0:dx:rho;
   y = 0:dy:rho;
   % longitudinal dimension
   z = 0:dz:z_max;

   [E, Nx, Ny, Nz] = compute_fieldmap (geometry, space, phi, x, y, z);

   % axisymmetry
   x = [-flip(x(2:end)) x];
   y = [-flip(y(2:end)) y];
   Nx = 2*Nx-1;
   Ny = 2*Ny-1;

   % E-field in MV/m for Astra
   write_fieldmap (filename, Nx, x, Ny, y, Nz, z, E*1e-6);
end
