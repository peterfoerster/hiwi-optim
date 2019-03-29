function [] = write_fieldmap (Nx, x, Ny, y, Nz, z, E)
  fid = fopen('DC-3D.ex', 'w');
  dlmwrite(fid, [Nx x], ' ');
  dlmwrite(fid, [Ny y], ' ', 'append', 'on');
  dlmwrite(fid, [Nz z], ' ', 'append', 'on');
  for iz=1:Nz
    for iy=1:Ny
      dlmwrite(fid, reshape(E(:,iy,iz,1), 1, Nx), ' ', 'append', 'on');
    end
  end
  fclose(fid);

  fid = fopen('DC-3D.ey', 'w');
  dlmwrite(fid, [Nx x], ' ');
  dlmwrite(fid, [Ny y], ' ', 'append', 'on');
  dlmwrite(fid, [Nz z], ' ', 'append', 'on');
  for iz=1:Nz
    for iy=1:Ny
      dlmwrite(fid, reshape(E(:,iy,iz,2), 1, Nx), ' ', 'append', 'on');
    end
  end
  fclose(fid);

  fid = fopen('DC-3D.ez', 'w');
  dlmwrite(fid, [Nx x], ' ');
  dlmwrite(fid, [Ny y], ' ', 'append', 'on');
  dlmwrite(fid, [Nz z], ' ', 'append', 'on');
  for iz=1:Nz
    for iy=1:Ny
      dlmwrite(fid, reshape(E(:,iy,iz,3), 1, Nx), ' ', 'append', 'on');
    end
  end
  fclose(fid);
end
