function [] = write_dat3D (filename, X, Y, Z)
   % write to .dat file
   fprintf(['creating' filename '\n']);
   fid = fopen(filename, 'w');
   fprintf(fid, 'x y z\n');
   for icol=1:size(X,2)
      dlmwrite(fid, [X(:,icol) Y(:,icol) Z(:,icol)], 'delimiter', '  ', 'append', 'on');
   end
   fclose(fid);
end
