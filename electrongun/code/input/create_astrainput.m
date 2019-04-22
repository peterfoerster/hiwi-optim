function [] = create_astrainput (filename, inputfilename, cathode_start, H_max, H_min, beamtube_end, mapname, options)
  fid = fopen (filename, 'w');
  % newrun
    fprintf(fid, '&NEWRUN\n');
    fprintf(fid, '  Distribution = ''%s''\n', inputfilename);
    % mirror plane z-coordinate
    fprintf(fid, '  Z_Cathode = %d\n', cathode_start);
    % to avoid error when tracking off axis particle
    fprintf(fid, '  Track_On_Axis = True\n');
    % max time step in [ns]
    fprintf(fid, '  H_max = %d\n', H_max);
    fprintf(fid, '  H_min = %d\n', H_min);
    fprintf(fid, '/\n');

  % output
    fprintf(fid, '\n&OUTPUT\n');
    % end of beamtube
    fprintf(fid, '  ZSTOP = %d\n', beamtube_end);
    fprintf(fid, '  TrackS = True\n');
    fprintf(fid, '/\n');

  if (options.spacecharge)
  % space charge
    fprintf(fid, '\n&CHARGE\n');
    % normal space charge
    fprintf(fid, '  LSPCH = True\n');
    % 3D space charge
    % fprintf(fid, '  LSPCH3D=True\n');
    % curved cathode for space charge, only works in 2D
    % fprintf(fid, '  L_Curved_Cathode = True\n');
    % fprintf(fid, '  Cathode_Contour = ''cathode.dat''\n');
    fprintf(fid, '/\n');
  end

  % E-field
    fprintf(fid, '\n&CAVITY\n');
    fprintf(fid, '  LEField = True\n');
    fprintf(fid, '  File_Efield(1) = ''%s''\n', mapname);
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
