filename = 'photocathode.in';
fid = fopen (filename, 'w');

fprintf(fid, '&NEWRUN\n');
fprintf(fid, ' HEAD = '' Example of ASTRA manual''\n');
fprintf(fid, ' RUN=1\n');
fprintf(fid, ' Distribution = ''Example.ini'',  Xoff=0.0, Yoff=0.0,\n');
fprintf(fid, ' TRACK_ALL=T,  Auto_phase=T\n');
fprintf(fid, '\n H_max=0.001,  H_min=0.00\n');
fprintf(fid, '\n&OUTPUT\n');
fprintf(fid, ' ZSTART=0.0,  ZSTOP=1.5\n');
fprintf(fid, ' Zemit=500, Zphase=1\n');
fprintf(fid, 'RefS=T\n');
fprintf(fid, 'EmitS=T, PhaseS=T\n');
fprintf(fid, '/\n');
fprintf(fid, '\n&CHARGE\n');
fprintf(fid, ' LSPCH=F\n');
fprintf(fid, ' Nrad=10, Cell_var=2.0, Nlong_in=10\n');
fprintf(fid, ' min_grid=0.0\n');
fprintf(fid, ' Max_Scale=0.05\n');
fprintf(fid, '/\n');
fprintf(fid, '\n&CAVITY\n');
fprintf(fid, ' LEField=T,\n');
fprintf(fid, 'File_Efield(1)=''3_cell.dat'', C_pos(1)=0.3\n');
fprintf(fid, ' Nue(1)=1.3, MaxE(1)=40.0, Phi(1)1=0.0,\n');
fprintf(fid, '/\n');
fprintf(fid, '&SOLENOID\n');
fprintf(fid, ' LBField=T,\n');
fprintf(fid, ' File_Bfield(1)=0.35, S_smooth(1)=10\n');
fprintf(fid, '/\n');

fclose (fid);

path = '/home/peter/hiwi-optim/code/photocathode';
command = ['cd ' path];
[status,cmdout] = system(command, '-echo');
command = ['./Astra ' filename];
[status,cmdout] = system(command, '-echo');
