function [] = create_astrainput (filename, options)
  fid = fopen (filename, 'w');
  % newrun
    fprintf(fid, '&NEWRUN\n');
    fprintf(fid, '  Distribution = ''electrongun.ini''\n');
    % mirror plane z-coordinate
    fprintf(fid, '  Z_Cathode = 0\n');
    fprintf(fid, '/\n');

  % output
    fprintf(fid, '\n&OUTPUT\n');
    % end of beamtube
    fprintf(fid, '  ZSTOP = 1\n');
    fprintf(fid, '  TrackS = True\n');
    fprintf(fid, '/\n');

  if (options.spacecharge)
  % space charge
    fprintf(fid, '\n&CHARGE\n');
    % normal space charge
    fprintf(fid, ' LSPCH = True\n');
    % 3D space charge
    % fprintf(fid, ' LSPCH3D=False\n');
    % curved cathode for space charge, only works in 2D
    % fprintf(fid, ' L_Curved_Cathode = False\n');
    % fprintf(fid, ' Cathode_Contour = ''cathode.dat''\n');
    fprintf(fid, '/\n');
  end

  % E-field, test first with .dat file and later 3D
    fprintf(fid, '\n&CAVITY\n');
    fprintf(fid, '  LEField = True\n');
    fprintf(fid, '  File_Efield(1) = ''DC-3D''\n');
    % electric field in MV/m
    fprintf(fid, '  C_noscale(1) = True\n');
    % all field components are given on the same grid
    fprintf(fid, '  Com_grid(1) = ''E''\n');
    fprintf(fid, '  Nue(1) = 0\n');
    fprintf(fid, '/\n');

  if (options.solenoid)
  % solenoid
    fprintf(fid, '&SOLENOID\n');
    fprintf(fid, ' LBField = True\n');
    fprintf(fid, ' File_Bfield(1) = ''solenoid.dat''\n');
    % magnetic field in T
    fprintf(fid, ' S_noscale(1) = True\n');
    fprintf(fid, '/\n');
  end
  fclose (fid);
end
