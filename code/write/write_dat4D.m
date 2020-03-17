function [] = write_dat4D (filename, X, Y, Z)
   % write to .dat file
   fprintf(['creating' filename '\n']);
   fid = fopen(filename, 'w');
   fprintf(fid, 'x y z c\n');
   for icol=1:size(X,2)
      dlmwrite(fid, [X(:,icol) Y(:,icol) Z(:,icol) ones(size(X,1))], 'delimiter', '  ', 'append', 'on');
      fprintf(fid, '\n');
   end
   fclose(fid);
end
