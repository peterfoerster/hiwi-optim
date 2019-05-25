function [] = write_dat3D (filename, x, y, z)
  % write to .dat file
  fprintf(['creating ' filename '\n']);
  fid = fopen(filename, 'w');
  fprintf(fid, 'x y z\n');
  for icol=1:length(x)
    dlmwrite(fid, [x(icol) y(icol) z(icol)], 'delimiter', '  ', 'append', 'on');
  end
  fclose(fid);
end
