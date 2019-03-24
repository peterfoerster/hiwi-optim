filename = 'electrongun.in';
fid = fopen (filename, 'w');

% newrun
  fprintf(fid, '&NEWRUN\n');
  fprintf(fid, '  HEAD = '' Egun''\n');
  fprintf(fid, '  Distribution = ''electrongun.ini''\n');
  fprintf(fid, '  N_red=1\n');
  % choose according to cathode shape
  fprintf(fid, '  Zoff=0\n');
  % false for tests
  fprintf(fid, '  TRACK_ALL=True\n');
%  fprintf(fid, '  Max_step=1\n');
  fprintf(fid, '  Lmonitor=True\n');
  fprintf(fid, '/\n');
% output
  fprintf(fid, '\n&OUTPUT\n');
  fprintf(fid, '  ZSTOP=0.3\n');
  fprintf(fid, '  Zemit=100\n');
  fprintf(fid, '  Zphase=1\n');
  fprintf(fid, '  TrackS=True\n');
  fprintf(fid, '/\n');
% space charge
%  fprintf(fid, '\n&CHARGE\n');
%  fprintf(fid, ' LSPCH=F\n');
%  fprintf(fid, ' Nrad=10, Cell_var=2.0, Nlong_in=10\n');
%  fprintf(fid, ' min_grid=0.0\n');
%  fprintf(fid, ' Max_Scale=0.05\n');
%  fprintf(fid, '/\n');
% E-field, test first with .dat file and later 3D
  fprintf(fid, '\n&CAVITY\n');
  fprintf(fid, '  LEField=True\n');
  fprintf(fid, '  File_Efield(1)=''DC-3D''\n');
  fprintf(fid, '  C_noscale(1)=True\n');
%  fprintf(fid, '  Com_grid(1)=''E''\n');
  fprintf(fid, '  Nue(1)=0\n');
  fprintf(fid, '/\n');
% solenoid
%  fprintf(fid, '&SOLENOID\n');
%  fprintf(fid, ' LBField=T,\n');
%  fprintf(fid, ' File_Bfield(1)=0.35, S_smooth(1)=10\n');
%  fprintf(fid, '/\n');

fclose (fid);

%path = '/home/peter/hiwi-optim/code/electrongun/astra';
%command = ['cd ' path];
%[status, cmdout] = system(command, '-echo');
%command = ['./Astra ' filename];
%[~, cmdout] = system(command, '-echo')
