function [] = write_generatorinput (filename, I_part, Q, z_min)
   fid = fopen (['generator_' filename], 'w');

   % input
   fprintf(fid, '&INPUT\n');
   fprintf(fid, '  FNAME = ''%s''\n', filename);
   fprintf(fid, '  Ipart = %d\n', I_part);
   fprintf(fid, '  Probe = True');
   fprintf(fid, '  Cathode = True');
   fprintf(fid, '  Q_total = %d\n', Q);
   fprintf(fid, '  Ref_zpos = %d\n', z_min);
   % photo emission for optimization?
   % fprintf(fid, '  Dist_z = ');
   % fprintf(fid, '  Dist_pz = ');
   % fprintf(fid, '  E_photon = ');
   % fprintf(fid, '  phi_eff = ');
   % fprintf(fid, '  Dist_x = ');
   % fprintf(fid, '  Dist_px = ');
   % fprintf(fid, '  Dist_y = ');
   % fprintf(fid, '  Dist_py = ');
   fprintf(fid, '/\n');

   fclose (fid);
end
