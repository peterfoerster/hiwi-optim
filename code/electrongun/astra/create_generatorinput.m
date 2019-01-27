filename = 'generatorinput.in';
fid = fopen (filename, 'w');

fprintf(fid, '&INPUT\n');
fprintf(fid, '  FNAME = ''Example.ini''\n');
fprintf(fid, '  ADD=FALSE,  N_add=0,\n');
fprintf(fid, '  IPart=500,  Species=''electrons''\n');
fprintf(fid, '  Probe=True,  Noise_reduc=T, Cathode=F\n');
fprintf(fid, '  Q_total=1.0E0\n');
fprintf(fid, '\n  Ref_zpos=0.0E0,  Ref_Ekin=2.0E0\n');
fprintf(fid, '\n  Dist_z=''gauss'',  sig_z=1.0E0, C_sig_z=2.0\n');
fprintf(fid, '  Dist_pz=''g'',  sig_Ekin=1.5, cor_Ekin=0.0E0\n');
fprintf(fid, '\n  Dist_x=''gauss'',  sig_x=0.75E0,\n');
fprintf(fid, '  Dist_px=''g'',  Nemit_x=1.0E0, cor_px=0.0E0\n');
fprintf(fid, '\n  Dist_y=''g'',  sig_y=0.75E0,\n');
fprintf(fid, '  Dist_py=''g'',  Nemit_y=1.0E0, cor_py=0.0E0\n');
fprintf(fid, ' /');

fclose (fid);

path = '/home/peter/hiwi-optim/code/photocathode';
command = ['cd ' path];
[status,cmdout] = system(command, '-echo');
command = ['./generator ' filename];
[status,cmdout] = system(command, '-echo');