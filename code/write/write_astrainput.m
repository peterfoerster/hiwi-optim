function [] = write_astrainput (filename, generatorname, z_min, H_max, H_min, z_max, fieldmapname, options)
   fid = fopen (filename, 'w');

   % newrun
   fprintf(fid, '&NEWRUN\n');
   fprintf(fid, '  Distribution = ''%s''\n', generatorname);
   fprintf(fid, '  Zoff = %d\n', z_min);
   fprintf(fid, '  Z_min = %d\n', z_min);
   fprintf(fid, '  Z_Cathode = %d\n', z_min);
   fprintf(fid, '  H_max = %d\n', H_max);
   fprintf(fid, '  H_min = %d\n', H_min);
   fprintf(fid, '/\n');

   % output
   fprintf(fid, '\n&OUTPUT\n');
   fprintf(fid, '  ZSTART = %d\n', z_min);
   fprintf(fid, '  ZSTOP = %d\n', z_max);
   % for optimization?
   % fprintf(fid, '  Zemit = %d\n', N_out);
   fprintf(fid, '  TrackS = True\n');
   % fprintf(fid, '  RefS = True\n');
   fprintf(fid, '/\n');

   % space charge
   if (options.spacecharge)
      fprintf(fid, '\n&CHARGE\n');
      % normal space charge
      fprintf(fid, '  LSPCH = True\n');
      % 3D space charge
      % fprintf(fid, '  LSPCH3D=True\n');
      fprintf(fid, '/\n');
   end

   % E-field
   fprintf(fid, '\n&CAVITY\n');
   fprintf(fid, '  LEField = True\n');
   fprintf(fid, '  File_Efield(1) = ''%s''\n', fieldmapname);
   % electric field in MV/m
   fprintf(fid, '  C_noscale(1) = True\n');
   % all field components are given on the same grid
   fprintf(fid, '  Com_grid(1) = ''E''\n');
   fprintf(fid, '  Nue(1) = 0\n');
   fprintf(fid, '/\n');

   fclose (fid);
end
