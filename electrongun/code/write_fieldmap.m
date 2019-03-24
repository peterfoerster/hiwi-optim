% write to files
fid = fopen('3D.ex', 'w');

dlmwrite(fid, [Nx x], ' ', 'append', 'on');

dlmwrite(fid, [Ny y], ' ', 'append', 'on');

dlmwrite(fid, [Nz z], ' ', 'append', 'on');
% no additional loop required
for iz=1:Nz
  dlmwrite(fid, E(:,:,iz,1), ' ', 'append', 'on');
end
fclose(fid);
