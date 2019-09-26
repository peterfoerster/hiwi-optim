function [] = write_dat3D (filename, X, Y, eu)
   % write to .dat file
   fprintf(['creating' filename '\n']);
   fid = fopen(filename, 'w');
   fprintf(fid, 'x y c\n');
   for icol=1:size(X,2)
      dlmwrite(fid, [X(:,icol) Y(:,icol) eu(:,icol)], 'delimiter', '  ', 'append', 'on');
      fprintf(fid, '\n');
   end
   fclose(fid);
end
