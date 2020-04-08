function [] = write_generatorinput (filename, Ipart, Q_total, sig_clock, geometry)
   % rms bunch size in [mm]
   rho   = 400e-3;
   z_min = nrbeval(geometry(6).nurbs, [1 0]);
   z_min = z_min(1);

   fid = fopen (['generator_' filename], 'w');

   % input
   fprintf(fid, '&INPUT\n');
   fprintf(fid, '  FNAME = ''%s''\n', filename);
   fprintf(fid, '  Ipart = %d\n', Ipart);
   fprintf(fid, '  Probe = True\n');
   fprintf(fid, '  Cathode = True\n');
   fprintf(fid, '  Q_total = %d\n', Q_total);
   % uniform longitudinal (also momentum?)
   fprintf(fid, '  Dist_z = uniform\n');
   fprintf(fid, '  sig_clock = %d\n', sig_clock);
   % Gaussian transversal
   fprintf(fid, '  Dist_x = gauss\n');
   % cut off?
   fprintf(fid, '  sig_x = %d\n', rho);
   fprintf(fid, '  Dist_y = gauss\n');
   fprintf(fid, '  sig_y = %d\n', rho);
   fprintf(fid, '/\n');

   fclose (fid);
end
