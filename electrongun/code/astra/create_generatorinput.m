filename = 'generatorinput.in';
fid = fopen (filename, 'w');

fprintf(fid, '&INPUT\n');
fprintf(fid, '  FNAME = ''electrongun.ini''\n');
% general
fprintf(fid, '  IPart=100\n');
fprintf(fid, '  Species=''electrons''\n');
fprintf(fid, '  Probe=True\n');
fprintf(fid, '  Noise_reduc=True\n');
% works the same as my implementation?
fprintf(fid, '  Cathode=False\n');
% radius instead of curved cathode, seems reasonable
fprintf(fid, '  R_Cathode=0.09\n');
% distributions
  % longitudinal
  fprintf(fid, '  Dist_z=''uniform''\n');
  fprintf(fid, '  Dist_pz=''uniform''\n');
  % horizontal
  fprintf(fid, '  Dist_x=''gauss'', sig_x=0\n');
  fprintf(fid, '  Dist_px=''gauss'', sig_px=0\n');
  % vertical, cut off at cathode ending
  fprintf(fid, '  Dist_y=''gauss'', sig_y=30, C_sig_y=2\n');
  fprintf(fid, '  Dist_py=''gauss''\n');
% last line
fprintf(fid, ' /');
fclose (fid);

path = '/home/peter/hiwi-optim/code/electrongun/astra';
command = ['cd ' path];
[status, cmdout] = system(command, '-echo');
command = ['./generator ' filename];
[~, cmdout] = system(command, '-echo')
